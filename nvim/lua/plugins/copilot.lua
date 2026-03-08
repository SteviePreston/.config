-- copilot.lua

return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = false, -- Disable inline suggestions, use blink.cmp instead
            },
            panel = {
                enabled = false, -- Disable panel, use blink.cmp instead
            },
            filetypes = {
                gitcommit = false,
                markdown = true,
                yaml = true,
            },
        })
    end,
}
