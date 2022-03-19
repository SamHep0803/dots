# sam's dotfiles
## installation
### arch
- dependancies
```
sudo pacman -Syu xorg-xserver xorg-xinit base-devel neovim zsh python3 python3-pip git neofetch firefox
```

- aur
```
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

- omz
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- install
```
git clone https://github.com/SamHep0803/dots ~/.dots/
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -s ~/.dots/lvim ~/.config/
ln -s ~/.dots/.zshrc ~/
ln -s ~/.dots/.xinitrc ~/
```
