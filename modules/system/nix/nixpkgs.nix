_: {
  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      # forced to add this because apple sdk is breaking ?
      allowUnsupportedSystem = true;
      # confused enough as things are, make things explicit
      allowAliases = false;
    };
  };
}
