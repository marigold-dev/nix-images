{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-generators }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      modules = [
        ./nix/configuration.nix
        ./nix/gnome.nix
        ./nix/nix-config.nix
        ./nix/nixpkgs-config.nix
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
