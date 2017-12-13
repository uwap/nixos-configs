{ nvim ? false, pkgs, lib, ... }:

with lib;
let
  vimrc   = pkgs.callPackage ./vimrc.nix {};
  plugins = pkgs.callPackage ./plugins.nix {};
in
{
  customRC = vimrc;
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;

    pluginDictionaries = map (x: { "name" = x; }) ([
      # from pkgs.vimPlugins
      "Syntastic"
      "ghcmod"
      "idris-vim"
      "neco-ghc"
      "deoplete-nvim"
      "vim-airline"
      "vim-airline-themes"
      "vimproc"
      "neosnippet"
      "neosnippet-snippets"
      "vim-nix"

      # from our own plugin package set
      "vim-afterglow"
    ] ++ optionals (nvim == false) [
      "vim-hug-neovim-rpc"
      "nvim-yarp"
    ]);
  };
}
