{ pkgs, ... }:
{
  home.packages = [
    pkgs.inotify-tools
  ];
}
