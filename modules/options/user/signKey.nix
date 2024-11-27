{lib, ...}: {
  gitSigningKey = lib.mkOption {
    type = type.str;
    description = "The user's signing key for git";
  };
}
