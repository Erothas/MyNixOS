{ config, lib, pkgs, ... }: 

{

    programs.waybar = {
      enable = true;
    };

    xdg.configFile."waybar/style.css".text = ''
        * {
    border-top: none;
    border-radius: 0;
    font-family: Noto Serif, "Font Awesome 6 Free";
    font-weight: bold;
}

window#waybar {
    border: 2.5px solid #7851A9;
    border-radius: 8px;
    background: #191622;
    color: white;
    border-radius: 10px;
    opacity: 0.9;
}

#workspaces {
	margin: 5px;
	margin-left: 5px;
	border-radius: 5px;
}
#workspaces button {
    padding: 5px 6px;
    color: white;
    margin-top: 1px;
    margin-bottom: 1px;
    margin-right: 3px;
    margin-left: 3px;
    font-size: 16px;
}

#workspaces button.active {
    color: #000000;
    background-color: #7851A9;
    border-radius: 5px;
    margin-right: 3px;
    margin-left: 3px;
}

#workspaces button:hover {
	background-color: #7851A9;
	color: #000000;
	border-radius: 5px;

}

#workspaces button.urgent {
    background: #A50021;
    color: #ffffff;
    border-radius: 5px;
}

#clock {
    font-weight: bold;
    color: #ffffff;
}

#tray {
    margin-bottom: 10px;
}

#pulseaudio, #memory, #cpu, #temperature {
    margin-top: 3px;
}

#cpu.percentage, #memory.percentage, #pulseaudio.percentage, #temperature.percentage {
    margin-bottom: 8px;
}

#network {
    color: #ffffff;
   /*border-top-left-radius: 8px;*/
   /*border-bottom-left-radius: 8px;*/
    margin-bottom: 9px;
}
    '';

    xdg.configFile."waybar/config".text = ''
    [{
    "layer": "top", // Waybar at top layer
    "output": ["DP-3"],
    "position": "left", // Waybar position (top|bottom|left|right)
    "height": 1428, // Waybar height (to be removed for auto height)
    // "width": 1280, // Waybar width
    // Choose the order of the modules
    "modules-left": ["hyprland/workspaces"],
    "modules-center": ["clock"],
    "modules-right": ["tray","pulseaudio","pulseaudio#percentage","temperature","temperature#percentage","cpu","cpu#percentage","memory","memory#percentage","network"],
    // Modules configuration
    "wlr/workspaces": {
       "disable-scroll": true,
        "all-outputs": false,
        "format": "{icon}",
        "format-icons": {
            "1": "1",
            "2": "2",
            "3": "3",
            "4": "4",
            "5": "5",
	          "6": "6",
	          "7": "7",
	          "8": "8",
	          "9": "9",
	          "10": "10",
            "urgent": "",
            "focused": "",
            "default": ""
        }
    },
    "tray": {
        "icon-size": 19,
        "spacing": 4
    },
    "clock": {
        "timezone": "Europe/Berlin",
	"format": "{:%I:%M
  %p}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format-alt": "{:%Y-%m-%d}"
    },
    "cpu": {
        "format": "",
        "tooltip": true,
    },
    "cpu#percentage": {
        "format": " {usage}%",
        "tooltip":  true,
        "interval": 5
    },
    "memory": {
        "format": "",
        "tooltip": true,
    },
    "memory#percentage": {
        "format": " {}%",
        "tooltip": true,
        "interval": 5
    },
    "network": {
        "format": "{essid} ",
        "format-wifi": " {ifname} ({signalStrength}%)",
        "format-ethernet": "{}",
        "format-disconnected": "|",
	"tooltip-format-wifi": "{signalStrength}%",
  "tooltip-format": " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n",
	"max-length": 15,
	"on-click": "nm-connection-editor",
	"on-click-right": "foot -e nmtui",
    },
    "pulseaudio": {
        "scroll-step": 5, // %, can be a float
        "format": "{icon}",
        "format-bluetooth": "{icon} {volume}%",
        "format-bluetooth-muted": " {icon}",
        "format-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "on-click": "pavucontrol"
    },
    "pulseaudio#percentage": {
        "format": " {volume}%",
        "on-click": "pavucontrol",
    },

    "temperature": {
        "format": ""
    },
    "temperature#percentage": {
        "hwmon-path": "/sys/class/hwmon/hwmon3/temp1_input",
        "format": " {temperatureC}°C",
        "interval": 5,
     },
},
{
    "layer": "top", // Waybar at top layer
    "output": ["DP-2"],
    "position": "left", // Waybar position (top|bottom|left|right)
    "height": 2148, // Waybar height (to be removed for auto height)
    "width": 60, // Waybar width
    // Choose the order of the modules
    "modules-left": ["hyprland/workspaces"],
    "modules-center": ["clock"],
    "modules-right": ["tray","pulseaudio","pulseaudio#percentage","temperature","temperature#percentage","cpu","cpu#percentage","memory","memory#percentage","network"],
    // Modules configuration
    "wlr/workspaces": {
       "disable-scroll": true,
        "all-outputs": false,
        "format": "{icon}",
        "format-icons": {
            "1": "1",
            "2": "2",
            "3": "3",
            "4": "4",
            "5": "5",
	          "6": "6",
	          "7": "7",
	          "8": "8",
	          "9": "9",
	          "10": "10",
            "urgent": "",
            "focused": "",
            "default": ""
        }
    },
    "tray": {
        "icon-size": 19,
        "spacing": 4
    },
    "clock": {
        "timezone": "Europe/Berlin",
	"format": "{:%I:%M
  %p}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
        "format-alt": "{:%Y-%m-%d}"
    },
    "cpu": {
        "format": "",
        "tooltip": true,
    },
    "cpu#percentage": {
        "format": " {usage}%",
        "tooltip":  true,
        "interval": 5
    },
    "memory": {
        "format": "",
        "tooltip": true,
    },
    "memory#percentage": {
        "format": " {}%",
        "tooltip": true,
        "interval": 5
    },
    "network": {
        "format": "{essid} ",
        "format-wifi": " {ifname} ({signalStrength}%)",
        "format-ethernet": "{}",
        "format-disconnected": "|",
	"tooltip-format-wifi": "{signalStrength}%",
  "tooltip-format": " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n",
	"max-length": 15,
	"on-click": "nm-connection-editor",
	"on-click-right": "foot -e nmtui",
    },
    "pulseaudio": {
        "scroll-step": 5, // %, can be a float
        "format": "{icon}",
        "format-bluetooth": "{icon} {volume}%",
        "format-bluetooth-muted": " {icon}",
        "format-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": ["", "", ""]
        },
        "on-click": "pavucontrol"
    },
    "pulseaudio#percentage": {
        "format": " {volume}%",
        "on-click": "pavucontrol",
    },
    "temperature": {
        "format": ""
    },
    "temperature#percentage": {
        "hwmon-path": "/sys/class/hwmon/hwmon3/temp1_input",
        "format": " {temperatureC}°C",
        "interval": 5,
    },
}]
    '';

}
    

