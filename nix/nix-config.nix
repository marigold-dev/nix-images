{ pkgs, ... }: {
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';

    settings = {
      substituters = [
        "https://cache.nixos.org/"
        "https://deku.cachix.org/"
        "https://anmonteiro.cachix.org/"
        "https://nixpkgs-update.cachix.org/"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "deku.cachix.org-1:wvaU5hkNzFLc8euHNB7BAvfr1jWvTPC3t4CnbRV5DxM="
        "anmonteiro.cachix.org-1:KF3QRoMrdmPVIol+I2FGDcv7M7yUajp4F2lt0567VA4="
        "nixpkgs-update.cachix.org-1:6y6Z2JdoL3APdu6/+Iy8eZX2ajf09e4EE9SnxSML1W8="
      ];
    };
  };
}
