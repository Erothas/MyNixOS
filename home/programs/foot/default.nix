{ config, pkgs, ... }:

  
{
  programs.foot = {
    enable = true;
    settings = {
      main = { 
        font = "ComicShannsMono Nerd Font Mono:size=14";
      };
      cursor = {
        style = "beam";
	blink = true;
      };
      colors = {
         alpha = "0.85";
         foreground = "E1E1E6";
         background = "191622";

 	 ## Normal/regular colors (color palette 0-7)
	 regular0 = "000000";  # black
	 regular1 = "FF5555";  # red
	 regular2 = "50FA7B";  # green
	 regular3 = "EFFA78";  # yellow
	 regular4 = "BD93F9";  # blue
	 regular5 = "FF79C6";  # magenta
	 regular6 = "8D79BA";  # cyan
	 regular7 = "ffffff";  # white

	 ## Bright colors (color palette 8-15)
	 bright0 = "4D4D4D";   # bright black
	 bright1 = "FF6E67";   # bright red
	 bright2 = "5AF78E";   # bright green
	 bright3 = "EAF08D";   # bright yellow
	 bright4 = "CAA9FA";   # bright blue
	 bright5 = "FF92D0";   # bright magenta
	 bright6 = "AA91E3";   # bright cyan
	 bright7 = "ffffff";   # bright white
      };
    # url = {
    #   launch = "xdg-open";
    #   osc8-underline = "always";
    # };
    };
  };
}


