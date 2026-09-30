vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cd", "<CMD>Oil<CR>", { desc = "Open parent directory" })
