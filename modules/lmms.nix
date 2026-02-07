{ ... }:
{
  flake.nixosModules.lmms =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        (final: prev: {
          lmms = prev.lmms.overrideAttrs {
            src = final.fetchFromGitHub {
              owner = "LMMS";
              repo = "lmms";
              rev = "c62b42a7c9cbcc1eb61da00808968d6dbabe2ed9";
              sha256 = "sha256-IaFyd4U68tobI4IdX6L2OJlyHtRJ3DHepiRPJNdkPzw=";
              fetchSubmodules = true;
            };
            patches = [ ];
          };
        })
      ];
      environment.systemPackages = [ pkgs.lmms ];
    };
}
