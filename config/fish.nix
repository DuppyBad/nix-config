{pkgs, ...}: {
  enable = true;
  shellAliases = {
    "..." = "cd ../..";
    "v" = "nvim";
    "vi" = "nvim";
    "ga" = "git add *";
    "g" = "git";
    "copy" = "wl-copy";
    "ls" = "eza";
    "la" = "eza --all --icons --git";
  };
  shellAbbrs = {
    nhs = "nh os switch /home/kyrios/.config/nixos/";
    nhb = "nh os boot /etc/nixos/";
  };
  plugins = [
    {
      name = "grc";
      src = pkgs.fishPlugins.grc.src;
    }
    {
      name = "fzf-fish";
      src = pkgs.fishPlugins.fzf-fish.src;
    }
  ];
}
