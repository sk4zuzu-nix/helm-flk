{
  description = "A flake for helm";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-20.09;

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      stdenv.mkDerivation rec {
        name = "helm_sk4zuzu";
        version = "3.5.3";

        src = fetchurl {
          url = "https://get.helm.sh/helm-v${version}-linux-amd64.tar.gz";
          sha256 = "sha256-IXChpkSp4Lhj8AwXt2HOM9QyPaZPx0Vio6bfKrv2zXA=";
        };

        nativeBuildInputs = [ installShellFiles ];

        installPhase = ''
          install -D helm $out/helm
        '';

        fixupPhase = ":";
      };
  };
}
