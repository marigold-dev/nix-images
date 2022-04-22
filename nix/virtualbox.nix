{ lib, ... }:

# base config borrowed from https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/virtualbox-demo.nix
{
  boot.growPartition = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.fsIdentifier = "provided";

  users = {
    users.demo = {
      isNormalUser = true;
      description = "Demo user account";
      extraGroups = [ "wheel" "vboxsf" ];
      password = "demo";
      uid = 1000;
    };
  };

  services.xserver.displayManager = {
    autoLogin = {
      enable = true;
      user = "demo";
    };
    sddm.autoLogin.relogin = true;
  };

  # Add some more video drivers to give X11 a shot at working in
  # VMware and QEMU.
  services.xserver.videoDrivers =
    lib.mkOverride 40 [ "virtualbox" "vmware" "cirrus" "vesa" "modesetting" ];

  virtualisation.virtualbox.guest = {
    enable = true;
    x11 = true;
  };

  powerManagement.enable = false;
}
