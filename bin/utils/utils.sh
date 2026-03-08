#!/bin/bash

history-exec() {
    tmux-check || return 1
    
    local cmd=$(fc -l 1 | awk '{$1=""; print substr($0,2)}' | tail -r | uniq | \
        fzf --tmux 80%,60% --prompt='History: ' --no-preview)
    
    if [[ -n "$cmd" ]]; then
        eval "$cmd"
    fi
}
    
project-nav() {
    tmux-check || return 1
    local base_dir=${1:-~/Developer}
    
    local dir=$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | \
        sed 's|$HOME|~|g' | \
        fzf --tmux 85%,70% --prompt='Projects: ' --no-preview)
    
    if [[ -n "$dir" ]]; then
        local full_dir=$(echo "$dir" | sed "s|~|$HOME|g")
        cd "$full_dir"
    fi
}

project-root() {
    local root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
    cd "$root"
}

kill-process() {
    local pid=$(ps aux | fzf --tmux 90%,70% --header='Kill Process: ' | awk '{print $2}')
    [[ -n "$pid" ]] && kill -9 "$pid"
}

tail-logs() {
    tail -f "$1" | fzf --tmux 90%,90% --ansi --no-sort --tac
}

envs() {
    env | fzf --tmux 80%,70% --no-preview --header='Environment Variables'
}

note() {
    local note_file="$HOME/Documents/Notes/$(date +%Y-%m-%d).md"
    echo "## $(date +%H:%M:%S) - $*" >> "$note_file"
}

find-replace() {
    git-check || return 1
    
    echo -n "Search: "
    read search
    
    if [[ -z "$search" ]]; then
        echo "Search pattern cannot be empty"
        return 1
    fi
    
    echo -n "Replace: "
    read replace
    
    echo -n "File extensions (optional, e.g. go,md,yaml): "
    read extensions
    
    if [[ -n "$extensions" ]]; then
        fastmod "$search" "$replace" --extensions "$extensions"
    else
        fastmod "$search" "$replace"
    fi
}
