{
  config,
  lib,
  pkgs,
  ...
}:
let
  importAllNixFiles =
    path:
    let
      # nixFiles
      files = lib.filesystem.listFilesRecursive path;
      nixFiles = lib.lists.filter (file: lib.hasSuffix ".nix" file) files;
      # scriptBins

    in
    lib.lists.map import nixFiles;
in
{
  home.homeDirectory = "/home/otto";
  home.username = "otto";
  home.stateVersion = "25.11";
  imports = importAllNixFiles ./home;
}
