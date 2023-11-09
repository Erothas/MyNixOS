{ config, pkgs, inputs, vars, ... }:

let
  my_bemenu = pkgs.writeShellScriptBin "my_bemenu" ''
   j4-dmenu-desktop --dmenu='bemenu -i -l 10 -H 25 -M 850 --tb "#191622" --tf "#e534ebff" --fb "#191622" --ff "#94e2d5" --nb "#191622E6" --nf "#ffffffff" --hb "#e534ebff" --hf "#ffffffff" --ab "#191622E6" --af "#ffffffff" --fn FiraSans'
 '';

in

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };  
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };

  # Enable networking
  networking = {
    networkmanager.enable = true;
    hostName = "nixos"; # Define your hostname.
#iproute2.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "dvorak";
  };

  # Configure console keymap
  console.keyMap = "dvorak";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${vars.user} = {
    isNormalUser = true;
    description = "Sero";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    variables = {
      TERMINAL = "${vars.terminal}";
      EDITOR = "${vars.editor}";
      VISUAL = "${vars.editor}";
      BROWSER = "librewolf";
      VIDEO = "mpv";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c"; #bat pager fix
      NIXOS_OZONE_WL = "1"; #hint electron apps to use wayland
      FZF_DEFAULT_OPTS = "--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :500 {}'";
      GTK_USE_PORTAL = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
     };
    systemPackages = with pkgs; [
      mesa
      git
      killall
      btop
      bat
      libsForQt5.polkit-kde-agent
      libsForQt5.qtstyleplugin-kvantum
      qt6Packages.qtstyleplugin-kvantum
      zip
      unzip
      unrar
      curl
      pavucontrol
      wget2
      eza
      libsForQt5.qt5ct
      qt6Packages.qt6ct
      libnotify
      zsh-powerlevel10k
      appimage-run
      cachix
      #czkawka
      my_bemenu
    ];
  };
  # Enabling insecure packages
  nixpkgs.config.permittedInsecurePackages = [
    "electron-22.3.27"
    ];

  # Enable programs
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      histSize = 999999;
      histFile = "$HOME/.histfile";
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      shellAliases = {
        #vim = "nvim";
      };
    };
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };  
   security = {
   rtkit.enable = true;
   polkit.enable = true;
   pam.services.swaylock = {};
   };

   systemd.sleep.extraConfig = ''
      AllowSuspend=yes
   '';

  # Set fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      ubuntu_font_family
      font-awesome
      noto-fonts
    ];
     fontconfig = {
       enable = true;
#      defaultFonts = {
#      serif = ["Times, Noto Serif"];
#      sansSerif = ["Helvetica Neue LT Std, Helvetica, Noto Sans"];
#      monospace = ["Courier Prime, Courier, Noto Sans Mono"];
#    };
    };
   };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable greetd and tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --asterisks --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "greeter";
      };
    };
   };

  # List services that you want to enable:
  services = {
#mullvad-vpn.enable = true;
    pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
     wireplumber.enable = true; 
    };
   };

# hardware.opengl = {
#   enable = true;
#   extraPackages = with pkgs; [
#     vaapiVdpau
#     libvdpau-va-gl
#   ];
# };

  # Enables flakes & garbage collector
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";  
    };
    settings = {
      auto-optimise-store = true;
      #Hyprland Cachix
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.05";

}
