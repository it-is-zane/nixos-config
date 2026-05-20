{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    noctalia-shell
    quickshell
    xwayland-satellite
  ];

  # waybar ueses a special font for icons
  fonts.packages = with pkgs; [ font-awesome ];

  networking.wireless.enable = true; # niri doesn't manage wireless like kde/gnome

  services.blueman.enable = true;
}
