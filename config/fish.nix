{
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
