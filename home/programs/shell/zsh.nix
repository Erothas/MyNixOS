{ config, pkgs, vars, ... }: 

{

  programs = {
    zsh = {
      history =  {
        enable = true;  
        share = false;
        expireDuplicatesFirst = true;
        ignoreSpace = true;
      };
      plugins = [
        {name = "powerlevel10k";src = pkgs.zsh-powerlevel10k;file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";}
      ];
      initExtra = ''
       source ~/.p10k.zsh
      '';
      shellAliases = {
      };   
    };
  };

}

