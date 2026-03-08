#!/bin/bash

docker-check() {
    if ! command -v docker &> /dev/null; then
        echo "Docker is not installed"
        return 1
    fi
    
    if ! docker info &> /dev/null; then
        echo "Docker is not running or accessible"
        return 1
    fi
}

docker-container() {
    docker-check || return 1
    tmux-check || return 1
    
    local container=$(docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | tail -n +2 | \
        fzf --tmux 90%,70% --prompt="Docker Container> " \
            --preview='
                container_name=$(echo {} | awk "{print \$1}")
                echo "=== Container Info ==="
                docker inspect "$container_name" --format="ID: {{.Id}}"
                docker inspect "$container_name" --format="Image: {{.Config.Image}}"
                docker inspect "$container_name" --format="State: {{.State.Status}}"
                docker inspect "$container_name" --format="Created: {{.Created}}"
                echo
                echo "=== Recent Logs ==="
                docker logs --tail 10 "$container_name" 2>/dev/null
            ' \
            --preview-window=right:60% \
            --bind='enter:execute(
                container_name=$(echo {} | awk "{print \$1}")
                docker exec -it "$container_name" /bin/bash || docker exec -it "$container_name" /bin/sh
            )+abort' \
            --bind='ctrl-l:execute(
                container_name=$(echo {} | awk "{print \$1}")
                docker logs -f "$container_name"
            )+abort' \
            --bind='ctrl-s:execute-silent(
                container_name=$(echo {} | awk "{print \$1}")
                docker start "$container_name"
            )+reload(docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | tail -n +2)' \
            --bind='ctrl-x:execute-silent(
                container_name=$(echo {} | awk "{print \$1}")
                docker stop "$container_name"
            )+reload(docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | tail -n +2)' \
            --bind='ctrl-d:execute-silent(
                container_name=$(echo {} | awk "{print \$1}")
                docker rm -f "$container_name"
            )+reload(docker ps -a --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" | tail -n +2)' \
            --header='Enter: exec | Ctrl-L: logs | Ctrl-S: start | Ctrl-X: stop | Ctrl-D: delete')
}

docker-image() {
    docker-check || return 1
    tmux-check || return 1
    
    local image=$(docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}\t{{.CreatedSince}}" | tail -n +2 | \
        fzf --tmux 90%,70% --prompt="Docker Image> " \
            --preview='
                image_id=$(echo {} | awk "{print \$3}")
                echo "=== Image Details ==="
                docker inspect "$image_id" --format="ID: {{.Id}}"
                docker inspect "$image_id" --format="Created: {{.Created}}"
                docker inspect "$image_id" --format="Size: {{.Size}}"
                docker inspect "$image_id" --format="Architecture: {{.Architecture}}"
                echo
                echo "=== History ==="
                docker history "$image_id" --no-trunc | head -5
            ' \
            --preview-window=right:60% \
            --bind='enter:execute(
                image_name=$(echo {} | awk "{print \$1\":\" \$2}")
                read -p "Container name (optional): " container_name
                if [[ -n "$container_name" ]]; then
                    docker run -it --name "$container_name" "$image_name" /bin/bash || docker run -it --name "$container_name" "$image_name" /bin/sh
                else
                    docker run -it "$image_name" /bin/bash || docker run -it "$image_name" /bin/sh
                fi
            )+abort' \
            --bind='ctrl-d:execute-silent(
                image_id=$(echo {} | awk "{print \$3}")
                docker rmi -f "$image_id"
            )+reload(docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.ID}}\t{{.Size}}\t{{.CreatedSince}}" | tail -n +2)' \
            --header='Enter: run | Ctrl-D: delete')
}

docker-volume() {
    docker-check || return 1
    tmux-check || return 1
    
    local volume=$(docker volume ls --format "table {{.Name}}\t{{.Driver}}\t{{.Scope}}" | tail -n +2 | \
        fzf --tmux 80%,60% --prompt="Docker Volume> " \
            --preview='
                volume_name=$(echo {} | awk "{print \$1}")
                echo "=== Volume Info ==="
                docker volume inspect "$volume_name" --format="Name: {{.Name}}"
                docker volume inspect "$volume_name" --format="Driver: {{.Driver}}"
                docker volume inspect "$volume_name" --format="Mountpoint: {{.Mountpoint}}"
                docker volume inspect "$volume_name" --format="Created: {{.CreatedAt}}"
            ' \
            --preview-window=right:50% \
            --bind='ctrl-d:execute-silent(
                volume_name=$(echo {} | awk "{print \$1}")
                docker volume rm "$volume_name"
            )+reload(docker volume ls --format "table {{.Name}}\t{{.Driver}}\t{{.Scope}}" | tail -n +2)' \
            --header='Ctrl-D: delete volume')
}

docker-cleanup() {
    docker-check || return 1
    
    echo "Docker system cleanup options:"
    echo "1. Remove stopped containers"
    echo "2. Remove unused images"
    echo "3. Remove unused volumes"
    echo "4. Remove unused networks"
    echo "5. System prune (all unused objects)"
    echo "6. Aggressive cleanup (everything unused)"
    
    read -p "Select option (1-6): " choice
    
    case $choice in
        1) docker container prune -f ;;
        2) docker image prune -f ;;
        3) docker volume prune -f ;;
        4) docker network prune -f ;;
        5) docker system prune -f ;;
        6) docker system prune -af --volumes ;;
        *) echo "Invalid option" ;;
    esac
}
