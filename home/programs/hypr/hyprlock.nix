_: {
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        no_fade_in = true;
        ignore_empty_input = true;
      };
      auth = {
        fingerprint.enable = false;
      };
      background = [
        {
          monitor = "";
          path = "~/.config/nixos/assets/nix_mocha.png";
          blur_size = 5;
          blur_passes = 4;
        }
      ];
    };
  };
}
