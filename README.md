## Requirements

- `kitty` terminal: See [extras](./extras/kitty/) for `kitty` config
- a [nerd font](https://www.nerdfonts.com/)
- `node`: I recommend using a node version manager, like [fnm](https://github.com/Schniz/fnm)
- `python`
- `neovim`: Either _build from source_ or _use appimage_ (`v0.10` or newer)
- a clipboard manager (e.g. `xclip`) and
- and some other minor dependencies (see below)

```bash
sudo apt install xclip fd-find ripgrep -y
npm install -g yarn
npm install -g typescript
npm install -g @vue/typescript-plugin # only needed for vue projects
```

<details>
<summary>Recommend: Symlink nvim.appimage to nvim</summary>

```bash
mkdir -p ~/Applications
mv ~/Downloads/nvim.appimage ~/Applications
chmod u+x ~/Applications/nvim.appimage
sudo ln -s ~/Applications/nvim.appimage /usr/local/bin/nvim
```

</details>

<details>
<summary>For debian-based distro, you need to symlink fd-find to fd</summary>

```bash
# Make sure `bin` folder exist
mkdir -p ~/.local/bin

# Symlink `fdfind` to `fd`
ln -s $(which fdfind) ~/.local/bin/fd

# Add `.local/bin` to `$PATH` (change zshrc to whatever shell you're using)
echo "\n# Add .local/bin to PATH" >> ~/.zshrc
echo "export PATH=\"$HOME/.local/bin:\$PATH\"" >> ~/.zshrc
```

</details>

## Installation

- Backup your current neovim config (if any)

```bash
curl -fsSL https://raw.githubusercontent.com/xuanhung1509/nvim/main/scripts/backup.sh | bash
```

- Clone the repo

```bash
git clone https://github.com/xuanhung1509/nvim.git ~/.config/nvim
```

- Start neovim

```bash
nvim
```

## Known issues

- `eslint`:
  For projects with mixed config formats (e.g. monorepo), a file in folders with old config format has to be open first.
  If you open a file in folders with new config format first, opening a file in folders with old config format afterwards would raise an error that `eslint` cannot find the config file.

- Sometimes in `vue` files, code folding takes a long time to detect fold or simply doesn't work.
