{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Otto Hermann";
    userEmail = "ojhermann@gmail.com";
    aliases = {
      up = "!git remote update -p; git merge --ff-only @{u}";
    };
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
      push.autoSetupRemote = true;
    };
  };
}
