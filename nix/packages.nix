{ pkgs, ... }:

{
  # Add globaly available packages
  environment.systemPackages = with pkgs; [ vim curl wget git emacs vscode-fhs ];
}
