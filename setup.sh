#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo "not Please run as root."
    exit 1
fi

echo "Welcome to Fayaz-Modz Ricing Setup"

echo "Select type of installation"
echo " 1. Terminal Only"
echo " 2. Full bspwm setup"
echo " 3. stow"

read inst

if [[ ($inst == "1" || $inst == "2") ]]; then
  echo "Select your distribution: "
  echo " 1. archlinux"
  echo " 2. debian/ubuntu"
  echo " 3. termux"
  read distr
elif [[ $inst != "3" ]]; then
  echo "unknown option: $($inst)"
  echo $inst
  exit 1
fi

if [[ $distr == "3" ]]; then
  apt update -y && apt upgrade && apt install ncurses-utils
fi
  
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)


if [[ $distr == "1" && ($inst == "1" || $inst == "2") ]]; then
	if command -v yay &> /dev/null
	then
		echo "yay is already installed"
	else
		echo "Installing yay"
		sudo pacman -Sy --needed git base-devel
		git clone https://aur.archlinux.org/yay-bin.git $HOME/yay-bin
		cd $HOME/yay-bin
		makepkg -si
	fi

	echo "Installing useful packages: "

	if [[ $inst == "1" ]]; then
		yay -S stow neovim tmux starship zsh git zoxide
    stow --adopt neovim tmux starship zsh bat
	else
		yay -S stow neovim ttf-firacode-nerd noto-fonts noto-fonts-cjk \
		    picom-ftlabs-git autotiling kitty polybar feh rofi tmux starship zsh git zoxide fzf \
        	    xorg-xrandr maim xclip xorg-xsetroot gtk-engine-murrine imagemagick pamixer \
		    bspwm sxhkd dunst
    stow --adopt alacritty bspwm dotfiles gtk kitty picom tmux \
        backgrounds dunst nvim polybar rofi starship zsh bat
	fi

elif [[ $distr == "2" && ($inst == "1" || $inst == "2") ]]; then
  echo "Installing essential packages: "
  echo "You may need to install some packages manually"

  sudo apt update -y

  if [[ $inst == "2" ]]; then
	sudo apt install stow tmux starship zsh git zoxide fzf
  stow --adopt neovim tmux starship zsh bat
  else
  	sudo apt install stow kitty polybar feh rofi tmux starship zsh git zoxide
    echo "${BLUE} you need to install fork of picom for animations"
    echo "https://github.com/fdev31/picom"
    echo "${RESET}"
    echo "${BLUE} you need to install autotiling for best experience"
    echo "https://github.com/nwg-piotr/autotiling"
    echo "${RESET}"
    stow --adopt alacritty bspwm dotfiles gtk kitty picom tmux \
        backgrounds dunst nvim polybar rofi starship zsh bat
  fi

  echo "Installing starship: "
  curl -sS https://starship.rs/install.sh | sh

  echo "Installing neovim to /opt/nvim and linking to /usr/bin/nvim"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

  echo "${RED} You need to install noto-fonts and FiraCode Nerd Font manually.${RESET}"

elif [[ $distr == "3" ]]; then
  echo "Installing for termux"
  echo "Updating packages"
  apt update && apt upgrade && apt update
  apt install git neovim tmux zsh stow zoxide which fzf wget starship

  echo "${BLUE}Trying to install FiraCode Nerd Font${RESET}"
  mkdir ~/.termux
  wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/SemiBold/FiraCodeNerdFontMono-SemiBold.ttf -O ~/.termux/font.ttf
  wget https://raw.githubusercontent.com/catppuccin/termux/main/themes/catppuccin-macchiato.properties -O ~/.termux/colors.properties

  echo "Settting Zsh as default shell"
  chsh -s zsh
  stow --adopt stow tmux starship zsh zoxide
elif [[ $inst != "3" ]]; then
  echo "unknown option"
  exit 1
fi

stow --adopt alacritty bspwm dotfiles gtk kitty picom tmux \
  backgrounds dunst nvim polybar rofi starship zsh

if [ -d "~/.tmux/plugins/tpm" ]; then
  echo "Tmux Plugin Manager TPM is already installed."
else
  echo "${RESET}Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "${BLUE}Refresh the tmux by using Ctrl+b and then pressing 'I'"
echo "${GREEN}Installation is complete"
echo "${RESET}"
