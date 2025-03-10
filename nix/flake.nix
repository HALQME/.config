{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      profile = "orb-nix";
  in {
      # Packages
      packages.${system}.${profile} = pkgs.buildEnv {
          name = "${profile}";
          paths = with pkgs;
          [
              direnv
              gh
              git
              htop
              jq
              lazygit
              lsd
              neovim
              xh
          ];
      };

      # Set the default package
      defaultPackage.${system} = self.packages.${system}.${profile};

      # Applications
      apps.${system}.update = {
          type = "app";
          program = toString (pkgs.writeShellScript "update-script" ''
              set -e
              echo "Updating flake..."
              nix flake update --flake ~/.config/nix
              echo "Updating profile: ${profile}..."
              nix profile upgrade ${profile}
              read -p "Delete Garbages? [y/N] " answer
                if [ "$answer" = "y" ]; then
                    echo "Deleting Garbages..."
                    nix-collect-garbage -d
                    nix store gc
                else
                    echo "Garbages not deleted."
                fi
          ''
        );
      };
  };
}
