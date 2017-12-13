{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {
  "vim-afterglow" = buildVimPlugin {
    name = "vim-afterglow";
    src = fetchgit {
      url = "https://github.com/danilo-augusto/vim-afterglow";
      rev = "b7c60d4123520050cd2b1aa5377dacaa952ec10d";
      sha256 = "1k6b32yx3ag4idciziy5i2ibb5mm0xc2c2cdazfbvcap90xnyszs";
    };
  };
  "nvim-yarp" = buildVimPlugin {
    name = "nvim-yarp";
    src = fetchgit {
      url = "https://github.com/roxma/nvim-yarp.git";
      rev = "edb260a903e03531a1c228245a054414a37dfb69";
      sha256 = "1kxwgva20hhz2zhkll9f8i8xvj3cxzghf85jippj3y45xv3flg43";
    };
  };
  "vim-hug-neovim-rpc" = buildVimPlugin {
    name = "vim-hug-neovim-rpc";
    src = fetchgit {
      url = "https://github.com/roxma/vim-hug-neovim-rpc";
      rev = "0b8e70f3440852d00dd8d98afd6d6274496e3fb3";
      sha256 = "1d2r0qw0b1awmp8pi5ggamld2xlc981g8fkwbv32kwa8bn8m6wqx";
    };
  };
}
