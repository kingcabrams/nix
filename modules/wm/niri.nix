{ config, ... }:
{
  programs.niri = {
    settings = {
      environment."NIXOS_OZONE_WL" = "1";

      input = {
        keyboard = {
          xkb = {
            options = "caps:ctrl_modifier";
          };
        };
      };

      window-rules = [
        {
          matches = [{ app-id = "pavucontrol"; }];
          open-floating = true;
          min-width = 700;
          min-height = 600;
          max-width = 900;
          max-height = 800;
          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "top-right";
          };
        }
      ];

      binds = with config.lib.niri.actions; {
        "Mod+T".action = spawn "alacritty";
        "Mod+space".action = spawn "fuzzel";

        "Mod+Q".action = close-window;
        "Mod+Shift+E".action = quit;

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+R".action = switch-preset-column-width;

        "Mod+Ctrl+H".action = move-column-left;
        "Mod+Ctrl+L".action = move-column-right;
        "Mod+Ctrl+J".action = move-window-down;
        "Mod+Ctrl+K".action = move-window-up;

        "Mod+Shift+S".action = screenshot;

        "XF86AudioRaiseVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+";
        "XF86AudioLowerVolume".action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-";
        "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

        "XF86MonBrightnessUp".action = spawn "brightnessctl" "set" "+10%";
        "XF86MonBrightnessDown".action = spawn "brightnessctl" "set" "10%-";
      };
    };
  };
}
