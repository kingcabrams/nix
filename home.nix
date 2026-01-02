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

  home.file.".config/starship.toml".text = ''
# ~/.config/starship.toml
format = """
\\[cabrams@''${custom.hostname}$nix_shell\
( $directory)\
\\]\\$ 
"""
add_newline = false

[directory]
format = '[$path]($style)[$read_only]($read_only_style)'
style = 'bold white'
read_only = ' (RO)'

[nix_shell]
format = '[nixos]($style)'
style = 'bold blue'

[custom.hostname]
format = '[nixos]($style)'
style = 'bold red'
when = ''''test "$IN_NIX_SHELL" = ""''''
'';

  programs = {
    home-manager.enable = true;

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
      procs
      direnv
      nushell
      ripgrep
      vesktop
      firefox
      man-pages
      alacritty
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
