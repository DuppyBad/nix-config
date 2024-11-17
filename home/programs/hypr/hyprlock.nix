_: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
      };
      background = [
        {
          monitor = "";
          path = "screenshot";
          blur_size = 5;
          blur_passes = 4;
        }
      ];
      input-field = [
        {
          monitor = "DP-3";

          size = "300, 50";
          outline_thickness = 1;
          placeholder_text = ''<span font_family="Iosevka" foreground="##354479">Password please....</span>'';
          dots_spacing = 0.3;
          dots_center = true;
        }
      ];
    };
  };
}
