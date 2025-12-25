{ pkgs, lib, config, inputs, ... }:

{
  packages = [ pkgs.qmk pkgs.dos2unix ];

  languages.c.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
