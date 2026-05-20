{
  config,
  pkgs,
  inputs,
  security,
  ...
}:
{
  security.doas.enable = true;
  security.sudo.enable = false;
  security.doas.extraRules = [
    {
      users = [ "zaneg" ];
      keepEnv = true;
      persist = true;
    }
  ];
}
