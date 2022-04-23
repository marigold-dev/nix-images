{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators, home-manager }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
      modules = [
        ./nix/configuration.nix
        ./nix/gnome.nix
        ./nix/nix-config.nix
        ./nix/nixpkgs-config.nix
        home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.demo = { ... }: {
                imports = [
                  ./nix/home.nix
                ];
              };
            }
        ./nix/packages.nix
      ];

    in {
      packages.x86_64-linux = {
        virtualbox = nixos-generators.nixosGenerate {
          inherit pkgs;
          modules = modules ++ [ ./nix/virtualbox.nix ];
          format = "virtualbox";
        };

        install-iso = nixos-generators.nixosGenerate {
          inherit pkgs modules;
          format = "install-iso";
        };
      };

      hydraJobs.x86_64-linux = self.packages.x86_64-linux;
    };
}
