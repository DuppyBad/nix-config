{pkgs, ...}: {
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --greeting 'Please leave my computer alone' -r --cmd niri-session";
    };
  };
}
