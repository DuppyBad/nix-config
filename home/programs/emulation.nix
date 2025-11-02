{pkgs, ...}: {
  home.packages = with pkgs; [
    melonDS
    mgba
  ];
}
