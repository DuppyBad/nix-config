{pkgs, ...}:{
  enable = true;
  themes = {
    catppuccin_mocha = {
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "bat";
        rev = "d8c8c5af01e31154d52d814d249768b536de3ba1";
        sha256 = "FpgelIl0nyjVZ6DJlkbuYSBpkA53ULvZ4N2DqqYDgKU=";
      };
      file = "Catppuccin Mocha.tmTheme";
    };
  };
  theme = "catppuccin_mocha";
}
