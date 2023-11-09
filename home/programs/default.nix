{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hypr
    ./foot
    ./nvim
    ./shell
    ./helix
    ./waybar
    ./mako
    ./swaylock
  ]; 
}
