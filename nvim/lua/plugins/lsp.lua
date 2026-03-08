-- lsp-config.lua

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		
		vim.diagnostic.config({
			virtual_lines = false,
			virtual_text = false,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
				focusable = false,
				style = "minimal",
				max_width = 80,
				wrap = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
		})
		
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP: Go to previous LSP diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "LSP: Go to next LSP diagnostic" })
        vim.keymap.set("n", "<leader>em", function()
            local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
            if #diagnostics > 0 then
                local messages = {}
                for _, diag in ipairs(diagnostics) do
                    table.insert(messages, diag.message)
                end
                local text = table.concat(messages, "\n")
                vim.fn.setreg("+", text)
                vim.notify("Diagnostic copied to clipboard", vim.log.levels.INFO)
            else
                vim.notify("No diagnostics on this line", vim.log.levels.WARN)
            end
        end, { desc = "LSP: Copy diagnostic message to clipboard" })
		
		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
			end
		end
		
		local common_setup = { 
			capabilities = capabilities, 
			on_attach = on_attach, 
			autostart = true 
		}
		
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"gopls",
				"pyright",
				"ts_ls",
                "rust_analyzer",
				"terraformls",
			},
			automatic_installation = true,
			handlers = {
				function(server_name)
					lspconfig[server_name].setup(common_setup)
				end,
			},
		})
		
		vim.api.nvim_create_autocmd("CursorHold", {
			callback = function()
				vim.diagnostic.open_float(nil, { focusable = false })
			end,
		})
	end,
}
