vim.g.mapleader = " "
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


vim.keymap.set("n", "<leader>cd", function()
	require("oil").toggle_float()
end, { desc = "Toggle Oil float" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
		vim.keymap.set("i", "<C-Space>", function()
			vim.lsp.completion.get()
		end, { buffer = args.buf, desc = "LSP: trigger completion" })
	end,
})

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
		end

		-- Navigation
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "gi", vim.lsp.buf.implementation, "Implementation")
		map("n", "K", vim.lsp.buf.hover, "Hover docs")
		map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature help")

		-- Actions
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map({ "n", "v" }, "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, "Format")

		-- Diagnostics (warnings/errors)
		map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic under cursor")
		map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to location list")
		map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
		map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
	end,
})
