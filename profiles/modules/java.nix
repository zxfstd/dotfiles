{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.java;

in

{
  options = with lib; {
    my.modules.java = {
      enable = mkEnableOption ''
        Whether to enable java module
      '';
    };
  };

  config = with lib;
    mkIf cfg.enable {
      my = {
        user.packages = with pkgs; [
          jdk11
          gradle
          maven
        ];
        # env = {
        #   "_JAVA_OPTIONS" =
        #     ''-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"'';
        # };
      };

    };
}