{ pkgs, lib, config, options, ... }:

let
  cfg = config.my.modules.java;

in

{
  options = with lib; {
    my.modules.java = {
      enable = mkEnableOption "java" // {
        description = ''
          Install and setup the Java development kit.
          <note>
          <para>This adds JAVA_HOME to the global environment, by sourcing the
            jdk's setup-hook on shell init. It is equivalent to starting a shell
            through 'nix-shell -p jdk', or roughly the following system-wide
            configuration:
          </para>
          <programlisting>
            environment.variables.JAVA_HOME = ''${pkgs.jdk.home}/lib/openjdk;
            environment.systemPackages = [ pkgs.jdk ];
          </programlisting>
          </note>
        '';
      };

      package = mkOption {
        type = types.package;
        default = pkgs.jdk;
        defaultText = literalExpression "pkgs.jdk";
        description = ''
          Java package to install. Typical values are pkgs.jdk or pkgs.jre.
        '';
       
      };


    };
  };

  config = with lib;
    mkIf cfg.enable {
      environment = {
        systemPackages = [ cfg.package ];
         shellInit = ''
          test -e ${cfg.package}/nix-support/setup-hook && source ${cfg.package}/nix-support/setup-hook
          '';
          };
    };
}
