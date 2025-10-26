{
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";
      "$term" = "${lib.getExe pkgs.foot}";
      "$menu" = "${lib.getExe pkgs.fuzzel}";

      general = {
        border_size = 2;
      };
      decoration = {
        rounding = 4;
        blur = {
          enabled = true;
        };
      };

      #TODO add cursor to the nix layout set
      animations = {
        enabled = true;
        bezier = [
          "sine, 0.37, 0, 0.63, 1"
          "ease, .4,0.02,0.21,0.99"
        ];
        animation = [
          "border, 1, 6, default"
          "fade, 1, 3, ease"
          "windows, 1, 3, sine, slide"
          "windowsOut, 1, 3, ease, slide"
          "workspaces, 1, 2, ease"
        ];
      };

      windowrule = [
        # regex time
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
      };

      misc = {
        disable_autoreload = false;
        force_default_wallpaper = 0;
        enable_swallow = true;
        swallow_regex = "foot";
      };

      exec-once = [
        "${pkgs.wlsunset}/bin/wlsunset -S 08:00 -s 21:00"
        "systemctl --user start hyprpolkitagent"
        "${lib.getExe pkgs.waybar}"
        "${pkgs.hypridle}/bin/hypridle"
      ];

      monitor = [
        "DP-3,2560x1440@144,0x0,1"
        ",preferred,auto,1"
      ];

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bind =
        [
          # General WM controls
          "$mod, return, exec, $term"
          "$mod, L, exec, hyprlock"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, D, exec, $menu"
          "$mod, V, togglefloating"

          # tab functionality
          "$mod, Tab, workspace, e+1"
          "$mod SHIFT, Tab, workspace, e-1"

          # moving around without mouse
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"

          # Moving windows around
          "$mod SHIFT, up, movewindow, u"
          "$mod SHIFT, down, movewindow, d"
          "$mod SHIFT, left, movewindow, l"
          "$mod SHIFT, right, movewindow, r"

          # powerout menu
          "$mod SHIFT, E, exec, ${lib.getExe pkgs.wlogout}"

          # Colour picker
          "$mod SHIFT, P, exec, hyprpicker -a"

          # print screen functions
          "$mod SHIFT, S, exec, grimblast --notify copy area"
          ",Print, exec, grimblast --notify --cursor copy screen"
          "$mod, Print, exec, grimblast --notify copy active"

          # Music/Sound control
          # Default audio sink makes mute indicators untrustworthy in multimonitor systems
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioStop, exec, playerctl stop"
          ",XF86AudioPlay, exec, playerctl play-pause"
          ",XF86AudioPrev, exec, playerctl previous"
          ",XF86AudioNext, exec, playerctl next"
          "$mod SHIFT, L, exec, playerctl next"
          "$mod SHIFT, H, exec, playerctl previous"
          "$mod SHIFT, K, exec, playerctl play-pause"
          # Brightness control
          ",XF86MonBrightnessUp, exec, brightnessctl set +5%"
          ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ]
        ++ (
          #functional workspace defintion
          # taken from wiki.hyprland.org
          # binds $mod + {1..10} to the workspace corresponding
          builtins.concatLists (builtins.genList (
              x: let
                ws = let
                  c = (x + 1) / 10;
                in
                  builtins.toString (x + 1 - (c * 10));
              in [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
              ]
            )
            10)
        );
    };
    extraConfig = ''
      env = HYPRCURSOR_THEME, Bibata-Modern-Classic
      env = HYPRCURSOR_SIZE, 28
      env = XCURSOR_THEME, Bibata-Modern-Classic
      env = XCURSOR_SIZE, 28
      # nvidia hardware cursors are evil
      cursor {
        no_hardware_cursors = true
      }

      general {
      col.active_border = rgb(CBA6F7)
      }
    '';
  };
}
