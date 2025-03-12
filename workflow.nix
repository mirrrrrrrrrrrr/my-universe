{pkgs ? import <nixpkgs> {}}:
pkgs.runCommand "generate-ci" {} ''
  mkdir -p $out
  cat > $out/ci.yml <<EOF
  name: CI

  on:
    push:
      branches:
        - main
    pull_request:

  jobs:
    build:
      runs-on: ubuntu-latest

      steps:
        - name: Kodni klonlash
          uses: actions/checkout@v4

        - name: Nix-ni o'rnatish
          uses: cachix/install-nix-action@v27

        - name: Nix develop orqali ishlash
          run: |
            nix develop --command bash -c "
            echo 'Salom, Nix workflow ishlayapti!'
            "
  EOF
  cp $out/ci.yml ./ci.yml
  chmod +w ./ci.yml  # Faylga yozish huquqini qo‘shamiz
''
