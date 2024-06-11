{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "gamono";
    homeDirectory = "/home/gamono";
    stateVersion = "24.05";
  };
}
