#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo "not Please run as root."
    exit 1
fi

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

echo "Welcome to Fayaz-Modz Ricing Setup"

echo "Select type of installation"
echo " 1. Terminal Only"
echo " 2. Full i3 setup"
echo " 3. stow"

read inst

if [[ ($inst == "1" || $inst == "2") ]]; then
  echo "Select your distribution: "
  echo " 1. archlinux"
  echo " 2. debian/ubuntu"
  echo " 3. other"
  read distr
elif [[ $inst != "3" ]]; then
  echo "unknown option: $($inst)"
  echo $inst
  exit 1
fi


if [[ $distr == "1" && ($inst == "1" || $inst == "2") ]]; then
	if command -v yay &> /dev/null
	then
		echo "yay is already installed"
	else
		echo "Installing yay"
		sudo pacman -Sy --needed git base-devel
		git clone https://aur.archlinux.org/yay-bin.git $HOME
		cd $HOME/yay-bin
		makepkg -si
	fi

	echo "Installing useful packages: "

	if [[ $inst == "1" ]]; then
		yay -S stow neovim tmux starship zsh git zoxide
	else
		yay -S stow neovim ttf-firacode-nerd noto-fonts noto-fonts-cjk \
		    picom i3 kitty polybar feh rofi tmux starship zsh git zoxide fzf
	fi

elif [[ $distr == "2" && ($inst == "1" || $inst == "2") ]]; then
  echo "Installing essential packages: "
  echo "You may need to install some packages manually"

  sudo apt update -y

  if [[ $inst == "2" ]]; then
	sudo apt install stow tmux starship zsh git zoxide fzf
  else
  	sudo apt install stow picom i3 kitty polybar feh rofi tmux starship zsh git zoxide
  fi

  echo "Installing starship: "
  curl -sS https://starship.rs/install.sh | sh

  echo "Installing neovim to /opt/nvim and linking to /usr/bin/nvim"
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
  sudo rm -rf /opt/nvim
  sudo tar -C /opt -xzf nvim-linux64.tar.gz
  sudo ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

  echo "${RED} You need to install noto-fonts and FiraCode Nerd Font manually."
  echo "${RESET}"

elif [[ $dist == "3" ]]; then
  echo "Other Distributions are not yet availible."
  echo "Install the following packages manually"
  echo " - for terminal setup only: kitty stow git starship tmux zsh fzf neovim"
  echo " - for full i3 setup: stow neovim picom i3 kitty polybar feh rofi tmux starhsip zsh git zoxide fzf"
  echo ""
  echo "then run this script and select stow (3)"
  exit 1
elif [[ $inst != "3" ]]; then
  echo "unknown option"
  exit 1
fi

echo "creating links for .config"
stow alacritty  backgrounds  kitty  nvim  picom  polybar \
  rio  rofi  starship  tmux zsh i3

mkdir -p ~/.config/alacritty  backgrounds  ~/.config/kitty \
  ~/.config/nvim  ~/.config/picom  ~/.config/polybar  ~/.config/rio  ~/.config/rofi

if [ -d "~/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
  echo "Neovim Packer is already installed."
else
  echo "Installing Neovim Packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
   ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

echo "${BLUE}Important for neovim. open neovim to the file .config/nvim/lua/fayaz/packer.lua."
echo "And source the file using :so and run :PackerInstall to install the neovim dependencies"

if [ -d "~/.tmux/plugins/tpm" ]; then
  echo "Tmux Plugin Manager TPM is already installed."
else
  echo "${RESET}Installing tmux plugin manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "${BLUE}Refresh the tmux by using Ctrl+b and then pressing 'I'"
echo "${GREEN}Installation is complete"


