{ pkgs, cfg, ... }:
{
  home.packages = with pkgs; [
    # Ocaml tooling
    opam

    # nix tooling
    rnix-lsp
    nixpkgs-fmt

    # useful shell tools to have on hand
    binutils
    yarn
    openssh
    perf-tools
    jq
    watchexec
    cloc
    wget
    fzf
    file
    bat
    lsof
    bubblewrap
    psmisc
    comby
    socat
    shellcheck
  ];

  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "agnoster";
  };

  programs.git = {
    enable = true;
    aliases = {
      co = "checkout";
      branchname = "symbolic-ref --short -q HEAD";
      cp = "cherry-pick";
    };
  };

  programs.htop.enable = true;
}
