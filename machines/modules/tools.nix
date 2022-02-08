{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.tools;

  python = pkgs.python39.withPackages (p: with p; [
    ansible-core
    requests
    passlib
  ]);
in

{
  options = with lib; {
    my = {
      modules = {
        tools = {
          enable = mkEnableOption ''
            Whether to enable tools module
          '';
        };
      };
    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = with pkgs; [
          git
          git-chglog
          gnumake
          gomplate
          #hub
          ipcalc
          jq
          minio-client
          #ngrok
          nmap
          #p7zip
          platinum-searcher
          #pwgen
          python
          reflex
          rsync
          #s3cmd
          shellcheck
          #sops
          #terraform
          tmux
          tree
          #upx
          vim
          wget
          yq
          coreutils
        ];
      };
    };
}
