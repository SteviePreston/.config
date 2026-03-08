-- lualine.lua

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                icons_enabled = true,
                refresh = {
                    statusline = 50,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "showcmd", "lsp_status", "diff", "diagnostics" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
