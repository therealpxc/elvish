{ nixpkgs ? import <nixpkgs> {}, stdenv ? nixpkgs.stdenv}:

with nixpkgs;

rec

{ 
  elvish = pkgs.elvish.overrideAttrs (oldAttrs: {
    name = "elvish-local";
    src = ./.;
  });

  env = stdenv.mkDerivation {
    name = "elvish-env";
    buildInputs = [ elvish ];
    shellHook =
      ''
        exec elvish
      '';
  };
}
