{ config, lib, inputs, pkgs, ... }:

{

  home.packages = with pkgs; [ 
    wlr-randr
    swaybg
    swayidle
    slurp
    grim
    wl-clipboard
    bemenu
    j4-dmenu-desktop
    hyprpicker
    grimblast
    wev
    wlsunset
    wl-screenrec
  ];

  home = {
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GDK_BACKEND = "wayland,x11";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    extraConfig = ''


# █▀▄▀█ █▀█ █▄ █ █ ▀█▀ █▀█ █▀█
# █ ▀ █ █▄█ █ ▀█ █  █  █▄█ █▀▄
#monitor=DP-1,2560x1440@144,2560x0,1
monitor=DP-3,2560x1440@144,3840x0,1
monitor=DP-2,3840x2160@60,0x0,1
#Workspace Rules
workspace=DP-3,1
workspace=DP-3,2
workspace=DP-3,3
workspace=DP-3,4
workspace=DP-3,5
workspace=DP-3,6
workspace=DP-2,7
workspace=DP-2,8
workspace=DP-2,9
workspace=DP-3,10

# ▄▀█ █ █ ▀█▀ █▀█   █▀ ▀█▀ ▄▀█ █▀█ ▀█▀
# █▀█ █▄█  █  █▄█   ▄█  █  █▀█ █▀▄  █
# Slow app launch fix
exec-once = waybar &
exec-once = mullvad-vpn &
exec-once = sleep 3; discord &

# █ █▀▄ █   █▀▀   █▀▀ █▀█ █▄ █ █▀▀ █ █▀▀
# █ █▄▀ █▄▄ ██▄   █▄▄ █▄█ █ ▀█ █▀  █ █▄█
exec-once = swayidle -w timeout 300 'swaylock -f -c 000000' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'
#exec-once = swayidle -w timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'

# █ █▄ █ █▀█ █ █ ▀█▀
# █ █ ▀█ █▀▀ █▄█  █ 
input {
    kb_layout = us
    kb_variant = dvorak
    kb_model =
    kb_options = caps:backspace
    kb_rules =

    follow_mouse = 1
    float_switch_override_focus = 2
    accel_profile = adaptive
    sensitivity = 0
}

# █▀▀ █▀▀ █▄ █ █▀▀ █▀█ ▄▀█ █
# █▄█ ██▄ █ ▀█ ██▄ █▀▄ █▀█ █▄▄
general {
    gaps_in = 5
    gaps_out = 6
    border_size = 3
    col.active_border = rgba(7851A9FF)
    col.inactive_border = rgba(00333333)

    layout = dwindle # master|dwindle

    apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
}

# █▀▄ █▀▀ █▀▀ █▀█ █▀█ ▄▀█ ▀█▀ █ █▀█ █▄ █
# █▄▀ ██▄ █▄▄ █▄█ █▀▄ █▀█  █  █ █▄█ █ ▀█
decoration {
    rounding = 9

    blur {
      enabled = true
      size = 7
      passes = 2 # more passes = more resource intensive.
      new_optimizations = true
      xray = false
      ignore_opacity = false
      }
    
    drop_shadow = true
    shadow_range = 5
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
    #shadow_offset = 2 2
}

# Blur specific apps
layerrule = blur,waybar

# ▄▀█ █▄ █ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄ █
# █▀█ █ ▀█ █ █ ▀ █ █▀█  █  █ █▄█ █ ▀█
animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 0, 1, default
}

# █   ▄▀█ █▄█ █▀█ █ █ ▀█▀ █▀
# █▄▄ █▀█  █  █▄█ █▄█  █  ▄█
dwindle {
    no_gaps_when_only = false
    force_split = 2
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true
}

# █▀▄▀█ █ █▀ █▀▀
# █ ▀ █ █ ▄█ █▄▄
misc {
    #disable_hyprland_logo = true
    always_follow_on_dnd = true
    #enable_swallow = false
    #swallow_regex = ^(kitty)$
    focus_on_activate = true
}
binds {
     workspace_back_and_forth = 0
     allow_workspace_cycles = 1
}

# █▄▀ █▀▀ █▄█ █▄▄ █ █▄ █ █▀▄ █▀
# █ █ ██▄  █  █▄█ █ █ ▀█ █▄▀ ▄█
$term = foot
$mainMod = SUPER
bind = $mainMod,TAB,workspace,previous
# -- Hyprland --
bind = $mainMod, Q, killactive,
bind = $mainMod SHIFT, M, exit,
bind = $mainMod, O, togglefloating,
bind = $mainMod, O, centerwindow,
bind = $mainMod SHIFT, F, fullscreen
bind = $mainMod, S, pin
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, Z, togglesplit, # dwindle
bind = $mainMod ALT, W, togglegroup,
bind = $mainMod, W, changegroupactive, f
# -- Terminal --
bind = $mainMod, RETURN, exec, $term
# -- Browser --
bind = $mainMod, I, exec, librewolf
bind = $mainMod ALT, I, exec, librewolf --private-window
# -- App Launcher --
#bind = ALT, SPACE, exec, fuzzel -i buuf-nestort -f FiraSans:size=19 -B 5 -b 191622E6 -t ffffffff -s e534ebff -S ffffffff -r 20 -C 7851a9ff -T kitty -l 7 -w 20
bind = $mainMod, M, exec, my_bemenu 
bind = $mainMod ALT, M, exec, scripts-launcher
# -- File Managers --
bind = $mainMod, F, exec, dolphin
bind = $mainMod ALT, F, exec, kitty -e zsh -i -c "lf"
# -- Night Mode --
bind = $mainMod SHIFT, N, exec, pgrep -x wlsunset && pkill wlsunset || wlsunset -T 4300
# -- Screenshot Capture --
bind = ,PRINT, exec, grimblast copy output && wl-paste -t image/png > $HOME/Pictures/screenshots/screenshot-$(date '+%F-%T').png
bind = CTRL, PRINT, exec, grimblast copy area && wl-paste -t image/png > $HOME/Pictures/screenshots/screenshot-$(date '+%F-%T').png
bind = ALT, PRINT, exec, grimblast --notify copy area 
bind = SHIFT, PRINT, exec, grimblast copy screen && wl-paste -t image/png > $HOME/Pictures/screenshots/screenshot-$(date '+%F-%T').png

#bind = $mainMod CTRL, V, exec, wl-screenrec --code hevc --audio -g "$(slurp)" -f videocapture-$(date '+%F-%T').mp4

#bind = $mainMod SHIFT, G,exec,hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"
#bind = $mainMod , G,exec,hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"
# -- Audio Control --
binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind=,XF86AudioMute,exec,amixer sset Master toggle
bind=,XF86AudioPlay,exec, playerctl play-pause
bind=,XF86AudioNext,exec, playerctl next
bind=,XF86AudioPrev,exec, playerctl previous

# -- System power --
bind = $mainMod CTRL ALT, X, exec, systemctl poweroff
bind = $mainMod CTRL ALT, R, exec, systemctl reboot
bind = $mainMod CTRL ALT, S, exec, systemctl suspend

bind = $mainMod, L, exec, swaylock

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, left, bringactivetotop
bind = $mainMod, right, movefocus, r
bind = $mainMod, right, bringactivetotop
bind = $mainMod, up, movefocus, u
bind = $mainMod, up, bringactivetotop
bind = $mainMod, down, movefocus, d
bind = $mainMod, down, bringactivetotop

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10
bind = $mainMod, period, workspace, e+1
bind = $mainMod, comma, workspace,e-1

bind = $mainMod SHIFT, minus, movetoworkspace,special
bind = $mainMod SHIFT, minus, togglespecialworkspace
bind = $mainMod, minus, togglespecialworkspace

bind = $mainMod SHIFT,left ,movewindow, l
bind = $mainMod SHIFT,right ,movewindow, r
bind = $mainMod SHIFT,up ,movewindow, u
bind = $mainMod SHIFT,down ,movewindow, d

# Move active window to a workspace with mainMod + CTRL + [0-9]
bind = $mainMod CTRL, 1, movetoworkspace, 1
bind = $mainMod CTRL, 2, movetoworkspace, 2
bind = $mainMod CTRL, 3, movetoworkspace, 3
bind = $mainMod CTRL, 4, movetoworkspace, 4
bind = $mainMod CTRL, 5, movetoworkspace, 5
bind = $mainMod CTRL, 6, movetoworkspace, 6
bind = $mainMod CTRL, 7, movetoworkspace, 7
bind = $mainMod CTRL, 8, movetoworkspace, 8
bind = $mainMod CTRL, 9, movetoworkspace, 9
bind = $mainMod CTRL, 0, movetoworkspace, 10
bind = $mainMod CTRL, left, movetoworkspace, -1
bind = $mainMod CTRL, right, movetoworkspace, +1

# same as above, but doesnt switch to the workspace
bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

# Scroll through existing workspaces with mainMod + scroll
#bind = $mainMod, mouse_down, workspace, e+1
#bind = $mainMod, mouse_up, workspace, e-1

#bind = $mainMod,R,submap,resize
submap = resize
binde =,right,resizeactive,30 0
binde =,left,resizeactive,-30 0
binde =,up,resizeactive,0 -30
binde =,down,resizeactive,0 30
binde =,l,resizeactive,30 0
binde =,h,resizeactive,-30 0
binde =,k,resizeactive,0 -30
binde =,j,resizeactive,0 30
bind =,escape,submap,reset
submap = reset

binde=CTRL SHIFT, left, resizeactive,-30 0
binde=CTRL SHIFT, right, resizeactive,30 0
binde=CTRL SHIFT, up, resizeactive,0 -30
binde=CTRL SHIFT, down, resizeactive,0 30
binde=CTRL SHIFT, l, resizeactive, 30 0
binde=CTRL SHIFT, h, resizeactive,-30 0
binde=CTRL SHIFT, k, resizeactive, 0 -30
binde=CTRL SHIFT, j, resizeactive, 0 30

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow


# Float Necessary Windows
windowrulev2 = float,class:^()$,title:^(Picture in picture)$
windowrulev2 = float,class:^(brave)$,title:^(Save File)$
windowrulev2 = float,class:^(brave)$,title:^(Open File)$
windowrulev2 = float,class:^(LibreWolf)$,title:^(Picture-in-Picture)$
windowrulev2 = float,class:^(blueman-manager)$
windowrulev2 = float,class:^(xdg-desktop-portal-gtk)$
windowrulev2 = float,class:^(xdg-desktop-portal-kde)$
windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$


   '';
  };
}
