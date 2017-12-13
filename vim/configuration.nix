{ config, pkgs, lib, ... }@params:
let
  custom_vim = pkgs.vim_configurable.customize {
    vimrcConfig = (import ./customization.nix params);
    name = "vim";
  };
  
  vim = lib.overrideDerivation custom_vim (o: {
    aclSupport              = false;
    cscopeSupport           = true;
    darwinSupport           = false;
    fontsetSupport          = true;
    ftNixSupport            = true;
    gpmSupport              = true;
    gui                     = false;
    hangulinputSupport      = false;
    luaSupport              = true;
    multibyteSupport        = true;
    mzschemeSupport         = true;
    netbeansSupport         = false;
    nlsSupport              = false;
    perlSupport             = false;
    pythonSupport           = true;
    python3Support          = true;
    rubySupport             = true;
    sniffSupport            = false;
    tclSupport              = false;
    ximSupport              = false;
    xsmpSupport             = false;
    xsmp_interactSupport    = false;
  });

  nvim = pkgs.neovim.override {
    vimAlias = false;

    configure = (import ./customization.nix (params // { nvim = true; }));
  };
in
{
  environment.systemPackages = [
    vim
    nvim
    pkgs.python
    pkgs.python3
    pkgs.ctags
  ];
}
