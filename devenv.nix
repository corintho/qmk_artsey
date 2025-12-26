{ pkgs, lib, config, inputs, ... }:

{
  packages = [ pkgs.qmk pkgs.dos2unix pkgs.just pkgs.watchexec];

  languages.c.enable = true;

  enterShell = ''
      qmk config user.overlay_dir="$(realpath .)"
  '';
}
