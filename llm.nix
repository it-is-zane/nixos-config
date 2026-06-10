{
  config,
  pkgs,
  inputs,
  ...
}:
let
  ollama-overlay =
    final: prev:
    let
      ollama_0_30_7 = final.stdenv.mkDerivation rec {
        pname = "ollama";
        version = "0.30.7";

        src = final.fetchurl {
          url = "https://github.com/ollama/ollama/releases/download/v${version}/ollama-linux-amd64.tar.zst";
          hash = "sha256-iMEQpsmpEw5e0KqQ9H6N2wE8tjjYNOEd3xUXF1cDTEw=";
        };

        rocm_src = final.fetchurl {
          url = "https://github.com/ollama/ollama/releases/download/v${version}/ollama-linux-amd64-rocm.tar.zst";
          hash = "sha256-hBEdNul0g6oe+0KF9A1NgZzAsP/2Z54ge4ofj4YsNj4=";
        };

        sourceRoot = ".";

        installPhase = ''
          mkdir -p $out/bin $out/lib
          cp -r bin/* $out/bin/
          cp -r lib/ollama $out/lib/

          tar -I zstd -xf ${rocm_src}
          cp -r lib/ollama/* $out/lib/ollama/
        '';

        doCheck = false;
        doInstallCheck = false;

        meta.mainProgram = "ollama";
      };
    in
    {
      inherit ollama_0_30_7;
      ollama = ollama_0_30_7;
      ollama-rocm = ollama_0_30_7;
    };
in
{

  nixpkgs.overlays = [ ];
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
  };
}
