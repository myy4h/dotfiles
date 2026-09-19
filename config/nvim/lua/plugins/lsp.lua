return {
    "neovim/nvim-lspconfig",
    {
        vim.lsp.enable({ "lua_ls", "nixd", "ts_ls", "html", "tailwindcss", "rust_analyzer", "svelte", "clangd", "jdtls" }),
    }
}
