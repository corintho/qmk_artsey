{ pkgs, ... }:

{
  packages = [ pkgs.qmk pkgs.dos2unix pkgs.usbutils pkgs.just pkgs.watchexec ];

  languages.c.enable = true;
}
