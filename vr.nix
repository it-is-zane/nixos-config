{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.steam.extraPackages = with pkgs; [
    libpng
    libpulseaudio
    libvorbis
    stdenv.cc.cc.lib
    udev
    qt5.qtbase
    nss
    nspr
  ];

  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  environment.systemPackages = with pkgs; [
    alvr
    wayvr
    android-tools
  ];
}
