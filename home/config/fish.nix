{pkgs, ...}: {
  enable = true;
  interactiveShellInit = ''
    set fish_greeting # greeting becomes empty string
  '';
  shellAliases = {
    "..." = "cd ../..";
    "v" = "nvim";
    "vi" = "nvim";
    "ga" = "git add *";
    "g" = "git";
    "copy" = "wl-copy";
    "ls" = "eza";
    "la" = "eza --all --icons --git";
    "gc" = "git commit";
    "lgit" = "lazygit";
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
