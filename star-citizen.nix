{ config, pkgs, ... }:

let
  nix-gaming = import (
    builtins.fetchTarball {
      url = "https://github.com/fufexan/nix-gaming/archive/master.tar.gz";
      sha256 = "1xb9gdki2sg5m59w85pfyfcczh1qj423vjkhdjkl8gkr2w59z3sn";
    }
  );
in
{
  # ...

  # See https://github.com/starcitizen-lug/knowledge-base/wiki/Manual-Installation#prerequisites
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };

  # # See RAM, ZRAM & Swap
  # swapDevices = [
  #   {
  #     device = "/var/lib/swapfile";
  #     size = 8 * 1024; # 8 GB Swap
  #   }
  # ];
  zramSwap = {
    enable = true;
    memoryMax = 32 * 1024 * 1024 * 1024; # 32 GB ZRAM
  };

  # The following line was used in my setup, but I'm unsure if it is still needed
  # hardware.pulseaudio.extraConfig = "load-module module-combine-sink";

  users.users.foo = {
    isNormalUser = true;
    description = "Foo";
    packages = with pkgs; [
      # tricks override to fix audio
      # see https://github.com/fufexan/nix-gaming/issues/165#issuecomment-2002038453
      (nix-gaming.packages.${pkgs.hostPlatform.system}.star-citizen.override {
        tricks = [
          "arial"
          "vcrun2019"
          "win10"
          "sound=alsa"
        ];
      })
    ];
  };

  # ...
}
