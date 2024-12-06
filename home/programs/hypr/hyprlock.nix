_: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = true;
        ignore_empty_input = true;
      };
      background = [
        {
          monitor = "";
          path = "~/.config/nixos/assets/nix_mocha.png";
          blur_size = 5;
          blur_passes = 4;
        }
      ];
      input-field = [
        {
          size = "300, 50";
          outline_thickness = 1;
          dots_spacing = 0.3;
          dots_center = true;
        }
      ];
      label = [
        {
          text = "$USER, welcome back.";
          font_family = "Iosevka";
          font_size = 24;
        }
        {
          text = "cmd[update:360000] date +'%a %b %d'";
          font_family = "Iosevka";
          font_size = 30;
          position = "0,100";
          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
