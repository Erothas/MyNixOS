{ config, pkgs, ...}:

{
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
    };
        xdg.configFile."swaylock/config".text = ''
            ignore-empty-password
            disable-caps-lock-text
            font=Noto Serif ExtraBold
            font-size=38
            screenshots
            effect-blur=20x9
            effect-vignette=0.5:0.5
            indicator
            indicator-radius=140
            indicator-thickness=20
            clock
            timestr=%I:%M %p
            datestr=%A, %d %B
            ring-color=7851A9
            key-hl-color=A3BE8C
            line-color=2E3440
            separator-color=3B4252
            inside-color=191622
            bs-hl-color=A3BE8C
            layout-bg-color=561D5E
            layout-border-color=9400D3
            layout-text-color=FFFFFF
            text-color=FFFFFF
        '';
}

