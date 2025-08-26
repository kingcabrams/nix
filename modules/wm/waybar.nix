{ config, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {

        layer = "top";
        spacing = 0;
        height = 30;
        margin-top = 0;
        margin-right = 0;
        margin-bottom = 0;
        margin-left = 0;
        modules-left = [
          "niri/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "tray"
          "cpu_text"
          "cpu"
          "memory"
          "battery"
          "pulseaudio"
        ];
        "niri/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          tooltip = false;
        };
        tray = {
          spacing = 10;
          tooltip = false;
        };
        clock = {
          format = "{:%a %d, %I:%M %p}";
          tooltip = false;
        };
        cpu = {
          format = "cpu {usage}%";
          interval = 2;
          states = {
            critical = 90;
          };
        };
        memory = {
          format = "mem {percentage}%";
          interval = 2;
          states = {
            critical = 80;
          };
        };
        battery = {
          format = "bat {capacity}%";
          interval = 5;
          states = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };
        pulseaudio = {
          on-click = "pavucontrol";
        };
      };
    };
    style = ''

* {
    border: none;
    border-radius: 0;
    min-height: 0;
    font-family: "mononoki";
    font-weight: bold;
    font-size: 16px;
    padding: 0;
}

window#waybar {
    background: #101010;
    border-bottom: 2px solid #4b4239;
}

tooltip {
    background-color: #101010;
    border: 2px solid #766451;
}

#clock,
#tray,
#cpu,
#memory,
#battery,
#pulseaudio {
    margin: 6px 6px 6px 0px;
    padding: 2px 8px;
}

#workspaces {
    background-color: #322d28;
    margin: 6px 0px 6px 6px;
    border: 2px solid #625343;
}

#workspaces button {
    all: initial;
    min-width: 0;
    box-shadow: inset 0 -3px transparent;
    padding: 2px 4px;
    color: #917a53;
}

#workspaces button.focused {
    color: #ddc7a1;
}

#workspaces button.urgent {
    background-color: #e78a4e;
    color: #1d2021;
}

#clock {
    background-color: #322d28;
    border: 2px solid #625343;
    color: #d4be98;
}

#battery {
    background-color: #a9b665;
    border: 2px solid #c7ab7a;
    color: #6c782e;
}

#tray,
#cpu,
#memory,
#pulseaudio {
    background-color: #c9af82;
    border: 2px solid #917a53;
    color: #1d2021;
}

#cpu.critical,
#memory.critical {
    background-color: #c9af82;
    border: 2px solid #917a53;
    color: #c14a4a;
}

#battery.warning,
#battery.critical,
#battery.urgent {
    background-color: #c9af82;
    border: 2px solid #917a53;
    color: #ae6330;
}    '';
  };
}
