vim.g.mapleader = " "
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


vim.keymap.set("n", "<leader>cd", function()
  require("oil").toggle_float()
end, { desc = "Toggle Oil float" })
