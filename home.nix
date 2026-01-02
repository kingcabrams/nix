{ pkgs, ... }:
{
  home.username = "cabrams";
  home.homeDirectory = "/home/cabrams";
  home.stateVersion = "25.05";

  imports = [
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  programs = {
    home-manager.enable = true;

    eza = {
        enable = true;
        enableFishIntegration = true;
        colors = "always";
        icons = "always";
        extraOptions = [
            "--group-directories-first"
        ];
    };

    helix = {
      enable = true;
      extraPackages = with pkgs; [
        nixd
    		nixpkgs-fmt

        rust-analyzer
    		rustfmt

        lua-language-server
    		stylua

    		pyright
    		ruff

    		clang-tools
      ];
    };

    bash.enable = true;

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      withPython3 = true;

      plugins = with pkgs.vimPlugins; [
        fzf-lua
        oil-nvim
        gruber-darker-nvim
        tokyonight-nvim
    		nvim-lspconfig
    		conform-nvim
    		lazydev-nvim
    		tabout-nvim
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
    		nixpkgs-fmt

        rust-analyzer
    		rustfmt

        lua-language-server
    		stylua

    		pyright
    		ruff

    		clang-tools
      ];
    };

    starship = {
        enable = true;
        enableFishIntegration = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    direnv = {
      enable = true;
    };

    fish.enable = true;

    yazi = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Caleb Abrams";
          email = "abramscma@gmail.com";
        };
        pull.rebase = true;
        core.editor = "nvim";
      };
    };
  };


  home.packages = with pkgs;
    [
      fd
      gcc
      git
      bat
      kitty
      procs
      direnv
      nushell
      ripgrep
      vesktop
      firefox
	  man-pages
      libreoffice
      wl-clipboard
	  man-pages-posix
      nerd-fonts.iosevka
    ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
