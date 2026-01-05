{ pkgs, ... }:
{
  home.file.".config/nvim".source = ./config;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      zenburn
      fzf-lua
      oil-nvim
      solarized-nvim
      conform-nvim
      lazydev-nvim
      gruvbox-material
      nvim-lspconfig
      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-rust
        p.tree-sitter-lua
        p.tree-sitter-nix
        p.tree-sitter-python
        p.tree-sitter-c
        p.tree-sitter-cpp
      ]))
    ];

    extraPackages = with pkgs; [
      nixd
      nixfmt

      rust-analyzer
      rustfmt

      lua-language-server
      stylua

      pyright
      ruff

      clang-tools
    ];
  };
}
