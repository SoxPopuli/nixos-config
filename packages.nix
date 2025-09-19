{ config, pkgs, inputs, ... }:
{
  users.users.charlotte.packages = with pkgs; [
    bat
    carapace
    clang
    fd
    fnm
    fzf
    gh
    gnumake
    just
    keepassxc
    llvmPackages.bintools
    nodejs_24
    nushell
    ripgrep
    rustup
    tmux
    tree-sitter
    zoxide
  ];
}
