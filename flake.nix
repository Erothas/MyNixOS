{
  description = "I hate flakes...";


  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager, hyprland, ... }:
    let
      vars = {
        user = "sero";
        #location = "$HOME/.config";
        terminal = "foot";
        editor = "nvim";
      };

      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;

    in {
      nixosConfigurations = {
        ${vars.user} = lib.nixosSystem { 
            inherit system;
        specialArgs = { inherit inputs vars; };
          modules = [

            ./configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs hyprland vars; };
                users.${vars.user} =  import ./home/home.nix ;
              };  
            }
          ];
        };
      };
    };
}
