{ inputs, pkgs, ... }:
{
  home.username = "cabrams";
  home.homeDirectory = "/home/cabrams";
  home.stateVersion = "25.05";

  imports = [
    ./modules/editor/nixCats.nix
  ];

  programs = {
    home-manager.enable = true;
    zellij.enable = true;
    helix.enable = true;
    direnv = {
      enable = true;
      enableZshIntegration = true;
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

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs;
    [
      gcc
      cloc
      nixd
      firefox
      ripgrep
      vesktop
      chromium
      man-pages
      nixpkgs-fmt
      wl-clipboard
      adwaita-icon-theme
      nerd-fonts.jetbrains-mono
    ];

  home.pointerCursor = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "chromium-browser.desktop";
      "x-scheme-handler/http" = "chromium-browser.desktop";
      "x-scheme-handler/https" = "chromium-browser.desktop";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Vanilla-DMZ";
    };
  };

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };
}
