{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      width = 1920;
      spacing = 4;
      modules-left = ["hyprland/workspaces" "custom/spotify"];
      modules-center = ["hyprland/window"];
      modules-right = ["pulseaudio" "backlight" "battery" "clock" "tray"];
      "hyprland/workspaces" = {
        all-outputs = true;
        disable-scroll = true;
        disable-click = false;
        on-click = "activate";
        format = "{name}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
        };
        #          persistent_workspaces = {
        #            "1" = [];
        #            "2" = [];
        #            "3" = [];
        #            "4" = [];
        #            "5" = [];
        #            "6" = [];
        #            "7" = [];
        #            "8" = [];
        #            "9" = [];
        #          };
      };
      "sway/mode" = {
        format = "{}";
        max-length = 20;
      };
      "hyprland/window" = {
        max-length = 50;
        format = "{}";
      };
      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon}  {volume}%";
        format-muted = " ";
        format-icons = {
          headphone = " ";
          hands-free = " ";
          headset = " ";
          phone = " ";
          portable = " ";
          car = " ";
          default = [" " " "];
        };
        scroll-step = 1;
        on-click = "pavucontrol";
        ignored-sinks = ["Easy Effects Sink"];
      };
      "backlight" = {
        format = "{icon} {percent}%";
        format-icons = [" " " "];
      };
      "battery" = {
        interval = 60;
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [" " " " " " " " " "];
      };
      "clock" = {
        format = "{:%A, %B %d, %H:%M}";
        interval = 1;
      };
      "tray" = {
        icon-size = 18;
        spacing = 8;
      };
    };
  };
  style = ''
    @define-color background #282a36;
    @define-color foreground #f8f8f2;
    @define-color selection #44475a;
    @define-color unfocused #6272a4;
    @define-color red #ff5555;
    @define-color green #50fa7b;
    @define-color yellow #f1fa8c;
    @define-color cyan #8be9fd;
    @define-color purple #bd93f9;
    @define-color pink #ff79c6;
    @define-color orange #ffb86c;
    * {
      font-family: mononoki nerd font mono;
      font-size: 14px;
      color: #f8f8f2;
      min-height: 16px;
      border-radius: 0px;
    }
    window#waybar {
    background: @background;
    }
    window#waybar.empty {
    	background: rgba(40, 42, 54, 0.6);
    }
    tooltip {
      background: #282a36;
    }
    #workspaces button {
      padding: 3px;
      color: @foreground;
    }
    #workspaces button.visible {
      border-bottom: 2px solid @purple;
      border-top: 2px solid @purple;	
    }
    #workspaces button.focused {
      border-bottom: 2px solid @purple;
      border-top: 2px solid @purple;
      background: @selection;
    }
    #workspaces button.urgent {
      color: @red;
    }
    #clock,
    #window,
    #battery,
    #pulseaudio,
    #tray,
    #tray {
      border-radius: 8px 8px 8px 8px;
      margin-right: 4px;
    }
    #window,
    #clock {
      margin: 4px;
    }
    #battery {
      margin: 4px;
    }
    #battery.warning {
      border: 2px solid @yellow;
      background: rgba (0, 0, 0, 0);
      border-radius: 0px;
      padding-left: 3px;
      padding-right: 3px;
     }
    #battery.critical {
      border: 2px solid @red;
      background: rgba (0, 0, 0, 0);
      border-radius: 0px;
      padding-left: 3px;
      padding-right: 3px;
    }'';
}
