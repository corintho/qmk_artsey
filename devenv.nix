{ pkgs, ... }:

{
  packages = with pkgs; [ qmk dos2unix usbutils just watchexec ];

  languages.c.enable = true;
  dotenv.disableHint = true;
}
