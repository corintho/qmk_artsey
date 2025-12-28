{ pkgs, ... }:

{
  packages = [ pkgs.qmk pkgs.dos2unix pkgs.usbutils pkgs.just pkgs.watchexec pkgs.bear ];

  languages.c.enable = true;
}
