{pkgs, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 14;
        margin = "10 10 0 10";
        modules-left = ["hyprland/workspaces" "mpris"];
        modules-center = ["hyprland/window"];
        modules-right = ["network" "memory" "wireplumber" "clock" "tray" "battery" "custom/wlogout"];

        "hyprland/workspaces" = {
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{name}";
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
          format = "{:%H:%M, %a %b %y}";
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
      };
    };
    style = builtins.readFile ./style.css;
  };
}
