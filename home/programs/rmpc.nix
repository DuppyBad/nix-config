{
  programs.rmpc = {
    enable = true;
    config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
      theme: Some("test"),
      cache_dir: Some("/home/kyrios/.cache/rmpc"),
      )
    '';
  };
  # xdg configFile here is a subset of home.file in effect
}
