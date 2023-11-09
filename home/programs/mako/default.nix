{ config, lib, pkgs, ... }: 

{
    services.mako = {
      enable = true;
      anchor = "top-right";
      font = "noto Sans Medium 11";
      backgroundColor = "#191622";
      borderColor = "#bd93f9";
      textColor = "#ffffff";
      borderRadius = 8;
      borderSize = 2;
      defaultTimeout = 6000;
      height = 110;
      width = 360;
      padding = "9";
      margin = "10";
      maxIconSize = 90;
      iconPath = "~/.local/share/icons/buuf-nestort";
      extraConfig = ''
        [urgency=high]
        background-color=#900000
        border-color=#000000
        default-timeout=9000
      '';
   };
}

