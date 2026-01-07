{ pkgs, ... }:

{
  packages = with pkgs; [ qmk dos2unix usbutils just watchexec ];

  languages.c.enable = true;
  languages.python = {
    enable = true;
    venv = {
      enable = true;
      quiet = false;
      requirements = "keymap-drawer";
    };
  };
  dotenv.disableHint = true;
}
