{ pkgs, lib, config, inputs, ... }:

{
  packages = [ pkgs.qmk pkgs.dos2unix ];

  languages.c.enable = true;

  enterShell = ''
      qmk config user.overlay_dir="$(realpath .)"
  '';
}
