{
  config,
  pkgs,
  inputs,
  ...
}:
{
  _module.args.username = "zaneg";

  home-manager.sharedModules = [
    {
      home.stateVersion = "25.11";
    }
  ];

  users.users.zaneg = {
    isNormalUser = true;
    description = "Zane Gant";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      pkgsRocm.blender
      discord-ptb
      furnace
      obs-studio
    ];
  };
}
