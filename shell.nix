{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell rec {
  buildInputs = [
    pkgs.nodejs_16
  ];

  shellHook = ''
    # Node.js versiyasini ko'rsatish
    echo "Node.js environment is ready!"
    echo "Node.js version: $(node -v)"
    echo "npm version: $(npm -v)"

    # Agar 'node_modules' papkasi mavjud bo'lsa, npm install qilish
    if [ -f "package.json" ]; then
      echo "Installing npm packages..."
      npm install
    fi
  '';
}
