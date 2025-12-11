{ inputs, pkgs, ... }:
let
neovim-master = pkgs.neovim-unwrapped.overrideAttrs (old: {
    version = "0.12.0";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo  = "neovim";
      rev   = "master"; 
      hash  = "sha256-mbC4oUTvSPc93C/ImbIjzTuu57RP0ayU/y00dxgN78s";
    };
  });
in
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
	helix.enable = true;

    zsh = {
      enable = true;
      defaultKeymap = "emacs";
      enableCompletion = true;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    git = {
      enable = true;
      userName = "Caleb Abrams";
      userEmail = "abramscma@gmail.com";
      extraConfig = {
        pull.rebase = true;
        core.editor = "nvim";
      };
    };
  };

  home.packages = with pkgs;
    [
      git
      nixd
      ripgrep
      vesktop
      firefox
      alacritty
      nixpkgs-fmt
	  libreoffice
      wl-clipboard
      neovim-master
      nerd-fonts.iosevka
      nerd-fonts.jetbrains-mono
    ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
