{ pkgs, ... }: {
  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
    settings = {
      editor = "hx";
      git_protocol = "https";
    };
  };
  programs.git = {
    enable = true;
    userName  = "gamono";
    userEmail = "alpatovaroslav3@gmail.com";
    lfs.enable = true;
  };
}
