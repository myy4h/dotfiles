return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        sitter = { "lua", "vim", "vimdoc", "bash", "python", "javascript", "markdown", "nix", "c", "cpp", "java", "tsx",
            "html", "css", }

        require("nvim-treesitter").setup()

        require("nvim-treesitter").install(sitter)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = sitter,
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
