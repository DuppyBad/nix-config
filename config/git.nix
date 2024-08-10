# basic configuration of git, imagine if we had our kyrios domain set properly
{
  enable = true;
  userName = "kyrios";
  userEmail = "kyrios@tinybrain.ltd";
  extraConfig = {
    init.defaultBranch = "main";
    safe.directory = "/home/kyrios/.config/nixos/system";
  };
}
