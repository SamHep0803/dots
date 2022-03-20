# sam's dotfiles
## installation
### arch
- dependancies
```
sudo pacman -Syu xorg-xserver xorg-xinit base-devel neovim zsh python3 python3-pip git neofetch firefox imagemagick
```

- aur
```
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

- omz
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- pywal
```
pip3 install pywal
```

- install
```
git clone https://github.com/SamHep0803/dots ~/.dots/
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
ln -s ~/.dots/lvim ~/.config/
ln -s ~/.dots/.zshrc ~/
ln -s ~/.dots/.xinitrc ~/
ln -s ~/.dots/.Xresources ~/
```

- fonts
```
sudo pacman -Syu ttc-iosevka ttf-iosevka-nerd ttc-iosevka-curly
```


- build dwm and st
```
# generate colorscheme
w
cd ~/.dots/suckless/dwm
sudo make clean install
cd ~/.dots/suckless/st
sudo make clean install
cd ~/.dots/suckless/dmenu
sudo make clean install
```
