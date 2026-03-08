-- splash.lua

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                         ",
            "  ███████╗████████╗███████╗██╗   ██╗██╗███████╗██████╗   ",
            "  ██╔════╝╚══██╔══╝██╔════╝██║   ██║██║██╔════╝██╔══██╗  ",
            "  ███████╗   ██║   █████╗  ██║   ██║██║█████╗  ██████╔╝  ",
            "  ╚════██║   ██║   ██╔══╝  ╚██╗ ██╔╝██║██╔══╝  ██╔═══╝   ",
            "  ███████║   ██║   ███████╗ ╚████╔╝ ██║███████╗██║       ",
            "  ╚══════╝   ╚═╝   ╚══════╝  ╚═══╝  ╚═╝╚══════╝╚═╝       ",
            "                                                         ",
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find File", ":FzfLua files<CR>"),
            dashboard.button("r", "  Recent Files", ":FzfLua oldfiles<CR>"),
            dashboard.button("g", "  Live Grep", ":FzfLua live_grep<CR>"),
            dashboard.button("s", "  Buffers", ":FzfLua buffers<CR>"),
            dashboard.button("b", "  Git Branch", ":FzfLua git_branches<CR>"),
            dashboard.button("c", "  Config", ":FzfLua files cwd=~/.config/nvim<CR>"),
            dashboard.button("l", "  Lazy", ":Lazy<CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
        }
        alpha.setup(dashboard.config)
    end,
}
