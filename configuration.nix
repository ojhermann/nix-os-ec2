{
  config,
  modulesPath,
  pkgs,
  ...
}:
{

  imports = [ "${modulesPath}/virtualisation/amazon-image.nix" ];
  ec2.efi = true;

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  }; # security.sudo

  system.stateVersion = "25.11";

  environment.shells = with pkgs; [ zsh ]; # environment.shells
  environment.systemPackages = with pkgs; [
    git
    helix
    tree
    typos
    zsh
    # helix
    # # bash
    bash-language-server
    shfmt
    # # nix
    nil
    nixd
    nixfmt
  ]; # environment.systemPackages
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  }; # environment.variables

  networking.hostName = "gorgonzola";

  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "*-*-* 00:00:00";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-linux";

  programs.ssh.startAgent = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      grep = "grep -i --color=auto";
      ls = "ls --color=auto";
      tree = "tree -C";
    }; # shellAliases
  }; # programs.zsh

  users.defaultUserShell = pkgs.zsh;
  users.users.otto = {
    isNormalUser = true;
    description = "otto";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP98KVJtOlcRc3WhHQb8MaDPPGgQmnNPjquYIa2q+ygH otto-admin-ec2\n"
    ]; # openssh.authorizedKeys.keys
    shell = pkgs.zsh;
  }; # users.users.otto
}
