{
  services.swaync = {
    enable = true;
    settings = {
    };
    style = builtins.readFile ./style.css;
  };
}
