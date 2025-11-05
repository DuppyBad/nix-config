{
  programs.anyrun = {
    enable = true;
    config = {
      x.fraction = 0.5;
      # y = 1 is the base of the window, 0 is the top
      y.fraction = 0.4;
      width.fraction = 0.25;
      layer = "overlay";
      showResultsImmediately = true;
      plugins = [
        "applications"
        "niri-focus"
        "rink"
      ];
    };
    extraCss = builtins.readFile ./style.css;
  };
}
