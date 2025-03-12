let
  workflowContent = ''
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
  '';
in
  # Faylni bevosita real YAML sifatida chiqarish
  builtins.writeTextFile {
    name = "ci.yml";
    text = workflowContent;
  }
