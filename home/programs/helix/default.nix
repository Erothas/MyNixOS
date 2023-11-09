{ config, pkgs, ...}:

{

  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula_at_night";
      editor = {
        line-number = "relative";
      	bufferline = "multiple";
	    };
      editor.cursor-shape = {
        insert = "bar";
      };  
     keys.normal = {
	   esc = [ "collapse_selection" "keep_primary_selection" ];
	   space.space = "file_picker";
      };
    };  
  };

}
