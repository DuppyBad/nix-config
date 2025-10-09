{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.wordlists.override {lists = with pkgs; [rockyou seclists];})
  ];
}
