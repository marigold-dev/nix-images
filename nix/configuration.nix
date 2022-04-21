{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    wireless.enable = false;
  };
  fonts.fonts = with pkgs; [ fira-mono fira-code roboto roboto-mono ];
}
