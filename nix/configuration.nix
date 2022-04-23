{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    wireless.enable = false;
  };
  fonts.fonts = with pkgs; [ fira-mono fira-code roboto roboto-mono ];

  # Add globaly available packages. Useful to debug if something breaks. 
  environment.systemPackages = with pkgs; [ vim curl wget git emacs ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
