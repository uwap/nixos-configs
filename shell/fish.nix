{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = "fish_vi_key_bindings";
    #    loginShellInit = ''
    #      pushd
    #      if test -e ~/.password-store/.git then
    #        cd ~/.password-store
    #        git fetch origin
    #        set passcommits (git rev-list HEAD...origin/master --count)
    #        if passcommits > 0 then
    #          echo "WARNING! Password Store is $passcommits behind!"
    #        end
    #      end
    #      popd
    #    '';
  };

  users.defaultUserShell = pkgs.fish;
}
