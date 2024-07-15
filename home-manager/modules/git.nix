{ pkgs, ... }:

{
  programs.gh = {
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
    extraConfig = {
     credential.helper = "${
         pkgs.git.override { withLibsecret = true; }
       }/bin/git-credential-libsecret";
    };
  };
}
