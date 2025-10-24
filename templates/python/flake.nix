{
  description = "Python project development environment with uv, ruff, pyinstaller, and black";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python312;
        pythonPackages = python.pkgs;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Core Python environment
            (python.withPackages (ps: with ps; [
              # Python packages for development tools
              uv
              ruff
              black
              pyinstaller
            ]))
            # Additional system tools (optional, for general dev)
            git
          ];

          shellHook = ''
            echo "ruff: for linting and formatting (ruff check .)"
            echo "black: for code formatting (black .)"
            echo "pyinstaller: for building executables (pyinstaller script.py)"
            echo "Python version: $(python --version)"
            echo ""
            echo "Run 'uv init' to start a new project or 'uv sync' after editing pyproject.toml."
          '';
        };
      }
    );
}
