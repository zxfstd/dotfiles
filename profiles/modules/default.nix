{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./settings.nix
    ./macos.nix

    #./acrobat.nix
    ./raycast.nix
    ./appcleaner.nix
    #./authy.nix
    #./bartender.nix
    #./blizzard.nix
    ./chrome.nix
    #./deezer.nix
    #./discord.nix
    ./dock.nix
    ./docker.nix
    #./element.nix
    ./etcher.nix
    ./finder.nix
    #./franz.nix
    ./git.nix
    ./gpg.nix
    #./hammerspoon.nix
    #./eulz.nix
    ./iterm.nix
    #./jabra.nix
    ./kya.nix
    #./lastpass.nix
    #./lens.nix
    #./macdown.nix
    #./mattermost.nix
    #./minecraft.nix
    #./multipass.nix
    #./ngrok.nix
    #./owncloud.nix
    ./rectangle.nix
    ./mpv.nix
    ./firefox.nix
    #./signal.nix
    #./slack.nix
    #./steam.nix
    #./teams.nix
    ./java.nix
    ./node.nix
    ./rust.nix
    ./go.nix
    ./mysql.nix
  ];

  my.modules = {
    macos.enable = lib.mkDefault true;
    docker.enable = lib.mkDefault true;
    finder.enable = lib.mkDefault false;
    iterm.enable = lib.mkDefault true;
    chrome.enable = lib.mkDefault true;
    # acrobat.enable = lib.mkDefault false;
    raycast.enable = lib.mkDefault true;
    appcleaner.enable = lib.mkDefault true;
    etcher.enable = lib.mkDefault true;
    # franz.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    gpg.enable = lib.mkDefault true;
    kya.enable = lib.mkDefault true;
    #lens.enable = lib.mkDefault true;
    rectangle.enable = lib.mkDefault true;
    mpv.enable = lib.mkDefault true;
    #authy.enable = lib.mkDefault true;
    #bartender.enable = lib.mkDefault true;
    #blizzard.enable = lib.mkDefault true;
    #deezer.enable = lib.mkDefault true;
    #discord.enable = lib.mkDefault true;
    #dock.enable = lib.mkDefault false;
    #element.enable = lib.mkDefault true;
    #eul.enable = lib.mkDefault true;
    #hammerspoon.enable = lib.mkDefault true;
    #jabra.enable = lib.mkDefault true;
    #lastpass.enable = lib.mkDefault true;
    #macdown.enable = lib.mkDefault true;
    #mattermost.enable = lib.mkDefault true;
    #minecraft.enable = lib.mkDefault true;
    #multipass.enable = lib.mkDefault true;
    #ngrok.enable = lib.mkDefault true;
    #owncloud.enable = lib.mkDefault true;
    #signal.enable = lib.mkDefault true;
    #slack.enable = lib.mkDefault true;
    #steam.enable = lib.mkDefault true;
    #teams.enable = lib.mkDefault true;
    firefox.enable = lib.mkDefault true;
    java.enable = lib.mkDefault true;
    node.enable = lib.mkDefault true;
    rust.enable = lib.mkDefault true;
    go.enable = lib.mkDefault true;
    mysql.enable = lib.mkDefault true;
  };
}
