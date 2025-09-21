{ config, pkgs, inputs, ... }:
let
    nvim-fhs = (with pkgs; buildFHSEnv {
      name = "nvf";
      targetPkgs = pkgs: [ neovim ];

      runScript = writeShellScript "nvf.sh" ''
        exec ${neovim}/bin/nvim "$@"
      '';
    });

    dotnet = (with pkgs.dotnetCorePackages; combinePackages [
        sdk_8_0-bin
        sdk_10_0-bin
    ]);

    devPackages = with pkgs; [
        nixd
        dotnet
    ];
in
{
  users.users.charlotte.packages = with pkgs; [
    bat
    carapace
    clang
    dmenu
    fd
    fnm
    fzf
    gh
    gnumake
    just
    keepassxc
    llvmPackages.bintools
    networkmanagerapplet
    nodejs_24
    nushell
    nvim-fhs
    ripgrep
    rustup
    tmux
    tree-sitter
    wofi
    zoxide
    unzip
    luarocks
  ] ++ devPackages;
}
