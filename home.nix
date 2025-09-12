{ inputs, pkgs, ... }:
{
  home.username = "cabrams";
  home.homeDirectory = "/home/cabrams";
  home.stateVersion = "25.05";

  imports = [
    ./modules/editor/nixCats.nix
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  programs = {
    home-manager.enable = true;
    zellij.enable = true;
    helix.enable = true;
    direnv = {
      enable = true;
      enableBashIntegration = true;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
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
        core.editor = "vim";
      };
    };
  };

  home.packages = with pkgs;
    [
      gcc13
      nixd
      ripgrep
      vesktop
      wezterm
      firefox
      man-pages
      nixpkgs-fmt
      wl-clipboard
    ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };
}
