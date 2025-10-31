{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 14;
        margin = "10 10 0 10";
        modules-left = ["niri/workspaces"];
        modules-center = ["wlr/taskbar"];
        modules-right = [
          #"network"
          "mpris"
          "memory"
          "wireplumber"
          "clock"
          "tray"
          "battery"
          "custom/notification"
          #"custom/wlogout"
        ];

        "hyprland/workspaces" = {
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{name}";
        };

        "niri/workspaces" = {
          format = "{icon}";
          format-icons = {
            active = "";
            default = "";
          };
        };

        "wlr/taskbar" = {
          all-outputs = false;
          format = "{icon}";
          icon-theme = "Papirus-Dark";
          icon-size = 16;
          tooltip = true;
          tooltip-format = "{title}";
          active-first = true;
          on-click = "activate";
        };

        "hyprland/window" = {
          format = "{}";
        };
        "tray" = {
          icon-size = 16;
          spacing = 5;
          show-passive-items = true;
        };
        "clock" = {
          format = "{:%H:%M, %a %d %b}";
          timezone = "Europe/London";
        };
        "memory" = {
          interval = 10;
          format = " {used:0.1f}G / {total:0.1f}G";
        };
        "network" = {
          format-ethernet = "󰈀 {gwaddr}";
          format-wifi = "󰖩 {signalStrength}%";
          tooltip-format-wifi = "via {essid}";
        };
        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 ";
          format-icons = ["" "" ""];
          on-click = "${pkgs.pwvucontrol}/bin/pwvucontrol";
        };
        "mpris" = {
          format = "{player_icon} {dynamic}";
          interval = 1;
          format-paused = "{status_icon} <i>{dynamic}</i>";
          dynamic-order = ["title" "artist" "album" "position"];
          player-icons = {
            default = "󰝚";
            spotify = "󰓇";
          };
          status-icons = {
            paused = "󰏤";
          };
        };
        "custom/wlogout" = {
          format = "";
          on-click = "${pkgs.wlogout}/bin/wlogout";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} ";
          format-icons = {
            notification = "󱥁";
            none = "󰍥";
            dnd-notification = "󱅮";
            dnd-none = "󱅯";
          };
          return-type = "json";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
        };
      };
    };
    style = builtins.readFile ./style.css;
  };
}
