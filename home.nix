{ pkgs, ... }:
{
  home.username = "cabrams";
  home.homeDirectory = "/home/cabrams";
  home.stateVersion = "25.11";

  imports = [
    ./modules/nvim
    ./modules/zellij
    ./modules/starship
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  programs = {
    home-manager.enable = true;

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
      mpv
      bat
      procs
      direnv
      ripgrep
      vesktop
      man-pages
      alacritty
      obs-studio
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
