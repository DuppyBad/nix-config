{
  enable = true;
  catppuccin.enable = true;
  xwayland.enable = true;
  systemd.enable = true;
  settings = {
    "$mod" = "SUPER";
    "$term" = "kitty";
    "$menu" = "fuzzel";

    bindm = 
      [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      ];
    bind =
      [
        "$mod, return, exec, $term"
        "$mod, Q, killactive"
        "$mod, F, fullscreen"
        "$mod, D, exec, $menu"
        "$mod, V, togglefloating"
        "$mod, Tab, workspace, e+1"
        "$mod SHIFT, Tab, workspace, e-1"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "$mod SHIFT, S, exec, grimblast --notify copy area"
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
    # cringe since it is specific to REAL hardware, breaks when distributed. can we specify via nix variables? TODO
    monitor = DP-3,2560x1440@239.96, 0x0, 1
    monitor = HDMI-A-5,1366x768@59.96400, 2560x0 ,1
    #Autostarting
    exec-once = hyprpanel
    # horrible gtk force theming, definitely a more elegant solution possible
    exec-once = gsettings set org.gnome.desktop.interface cursor-theme catppuccin-mocha-dark-cursors
    exec-once = gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark 
    exec-once = gsettings set org.gnome.desktop.interface color-scheme prefer-dark 

    env = HYPRCURSOR_THEME, catppuccin-mocha-dark-cursors
    env = HYPRCURSOR_SIZE, 28
    env = XCURSOR_THEME, catppuccin-mocha-dark-cursors
    env = XCURSOR_SIZE, 28

    input {
      kb_layout = gb
      follow_mouse = 1
    }

    # nvidia hardware cursors are evil
    cursor {
      no_hardware_cursors = true
    }

  '';
}
