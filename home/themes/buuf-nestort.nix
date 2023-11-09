 { config, lib, pkgs, ... }:

  let
  buuf-nestort = pkgs.stdenvNoCC.mkDerivation {
    pname = "buuf-nestort";
    version = "unstable-2023-11-05";

    src = pkgs.fetchurl {
      url = "https://git.disroot.org/eudaimon/buuf-nestort/archive/master.tar.gz";
      hash = "sha256-cZthOA7r87dmAsNGjCyrcFgbY9o/XtzgtgjqQj83aPs=";
    };

    installPhase = ''
      mkdir $out
      mv * $out/
    '';
  };

  buuf-cursor-heart = pkgs.stdenvNoCC.mkDerivation {
    pname = "buuf-cursor-heart";
    version = "master";

    src = pkgs.fetchurl {
      url = "https://cdn.discordapp.com/attachments/156048223314640896/1171146214247506111/buuf-cursor-heart-24-a.tar.gz";
      hash = "sha256-iO/cx/3Mp0KA8ze3PfG2SYleR4Omdr1EHvmINRxVRg8=";
    };

    installPhase = ''
      mkdir $out
      mv * $out/
      rm $out/index.theme
    '';
  };
 in
 {

  home.file.".local/share/icons/buuf-nestort".source = buuf-nestort;
  home.file.".local/share/icons/buuf-cursor-heart".source = buuf-cursor-heart;

  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
   };
  gtk = {
    enable = true;
    iconTheme = {
      name = "Buuf For Many Desktops";
      package = buuf-nestort;
    };  
    font = {
      name = "Ubuntu";
      size = 12;
    };  
    cursorTheme = {
      name = "buuf-cursor-heart";
      package = buuf-cursor-heart;
      size = 24;
    };
  };
   home.pointerCursor = {
     name = "buuf-cursor-heart";
     package = buuf-cursor-heart;
     size = 24;
   };

  xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=KvCurves3d
 '';

 }

