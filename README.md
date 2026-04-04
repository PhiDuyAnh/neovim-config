# Neovim 0.12.0 Config

## Required Installation

- Download Neovim 0.12.0 here: https://github.com/neovim/neovim/releases/tag/v0.12.0
- Create symlink for nvim:
```bash
ln -s ~/nvim-linux-x86_64/bin/nvim ~/bin/nvim
```

## Installation for plugins to work

### tree-sitter-cli

```bash
npm install tree-sitter-cli
```

- Or just download the binary from Github releases: https://github.com/tree-sitter/tree-sitter/releases

```bash
unzip tree-sitter-cli-linux-x64.zip
```

### ripgrep

```bash
tar -xzf ripgrep-*.tar.gz
mkdir -p ~/bin
mv ripgrep-*/rg ~/bin/
export PATH="$HOME/bin:$PATH"
source ~/.bashrc
```

### To use LSP and Ruff

- Install them separately in your Python venv
```bash
uv pip install python-lsp-server
uv pip install ruff
```

- Activate the virtual environment before use nvim
