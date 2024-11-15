# taken from bloxx12 -> from raf
{
  #Contains all options that modify nixpkgs

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      # Seen some electron  use cases for this, hopefully we never have to do this
      permittedInsecurePackages = [];
    };
  };
}
