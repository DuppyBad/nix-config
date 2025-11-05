{pkgs, ...}: {
  services.greetd = {
    enable = false;
    useTextGreeter = true;
    settings = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --greeting 'Please leave my computer alone' -r --cmd niri-session";
    };
  };
}
