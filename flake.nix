{
  description = "NixOwOs dots";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    stylix.url = "github:danth/stylix";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, stylix, aagl, ... }@inputs:

    let
      system = "x86_64-linux";
    in {

    # RyoYamada - system hostname (change to it)
    nixosConfigurations.RyoYamada = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixos/configuration.nix
        stylix.nixosModules.stylix
        {
          imports = [ aagl.nixosModules.default ];
          nix.settings = aagl.nixConfig;
          programs.anime-game-launcher.enable = true;
        }
      ];
    };

    homeConfigurations.gamono = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ 
        ./home-manager/home.nix
        stylix.homeManagerModules.stylix
      ];
    };
  };
}
