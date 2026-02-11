{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      wallpaperPlainColor = "0,0,0";
    };

    kwin.effects.blur = {
      enable = true;
      noiseStrength = 0;
      strength = 6;
    };

    kscreenlocker.appearance.wallpaperPlainColor = "0,0,0";

    panels = [
      {
        location = "top";
        floating = true;
        widgets = [
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.userswitcher"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.digitalclock"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
        ];
      }
      {
        location = "bottom";
        height = 80;
        hiding = "autohide";
        lengthMode = "fit";
        floating = true;
        widgets = [
          {
            iconTasks = {
              launchers = [ ];
            };
          }
        ];
      }
    ];
  };
}
