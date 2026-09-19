return {
    "neovim/nvim-lspconfig",
    {
        vim.lsp.enable({ "lua_ls", "nixd" }),
    }
}
