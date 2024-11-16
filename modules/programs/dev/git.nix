{pkgs, ...}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      user = {
        name = "kyrios";
        email = "Iseefa@proton.me";
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEjuzWXJAxCMhRiEvNneHD4iR8hQVR2S0pGK40ogWoWH";
      };
      init.defaultbranch = "main";
      gpg.format = "ssh";
      commit.gpgsign = "true";
    };
  };
}
