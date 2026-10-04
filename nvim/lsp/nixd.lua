---@type vim.lsp.Config
return {
    settings = {
        nixd = {
            nixpkgs = { expr = 'import <nixpkgs> { }' },
            formatting = { command = { 'nixfmt' } },
            options = {
                nixos = {
                    expr = '(builtins.getFlake "/etc/nixos/flake.nix").nixosConfigurations.HOSTNAME.options',
                },
                home_manager = {
                    expr = '(builtins.getFlake "/etc/nixos/flake.nix").homeConfigurations."fayeiha@nixos".options',
                },
            },
        },
    },
}
