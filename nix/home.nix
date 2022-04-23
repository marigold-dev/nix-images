{ pkgs, cfg, ... }:
{
  # Most programs are listed here in home.packages,
  # but some with more complex configurations are enabled
  # individually below.
  home.packages = with pkgs; [
    # Ocaml tooling
    opam

    # nix tooling
    rnix-lsp
    nixpkgs-fmt

    # The one IDE to rule them all...
    # JK, emacs and vim configs below - have fun
    vscode-fhs

    # useful shell tools to have on hand
    binutils
    curl
    wget
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
  
  programs.command-not-found.enable = true;
  
  # To spice things up
  home.file."backgrounds" = {
    source = ./dekstop-backgrounds;
    recursive = true;
  };
  services.random-background.enable = true;
}
