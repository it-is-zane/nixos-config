{
  config,
  pkgs,
  inputs,
  ...
}:
{
  environment.systemPackages = [ pkgs.git ];

  home-manager.sharedModules = [
    {
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = "Zane Gant";
            email = "zane.gant@gmail.com";
          };
          init.defaultBranch = "main";
        };
      };
    }
  ];
}
