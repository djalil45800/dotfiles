#!/usr/bin/env bash

PKGS=(
	amd-ucode base bluez-utils btop bun cliphist cups docker
	docker-compose eza fastfetch feh ffmpegthumbnailer firefox
	fnm ghostty gimp go impala lazydocker lazygit luarocks
	mesa-utils mpv neovim obs-studio ouch pulsemixer radeontop
	rustup shotcut slurp sof-firmware starship swappy sway
	system-config-printer tealdeer timeshift tree-sitter-cli
	udisks2 ufw vulkan-tools wget wlr-randr wofi xf86-video-amdgpu
	yazi zram-generator zsh-autosuggestions zsh-syntax-highlighting
)

AUR_PKGS=(
	bluetuith lazysql paru slack-desktop
)

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm "${PKGS[@]}"

if ! command -v paru &>/dev/null; then
	sudo pacman -S --needed --noconfirm base-devel git
	git clone https://aur.archlinux.org/paru-bin.git
	cd paru-bin && makepkg -si --noconfirm
	cd .. && rm -rf paru-bin
fi

paru -S --needed --noconfirm "${AUR_PKGS[@]}"

rustup default stable
sudo systemctl enable --now docker.service
sudo systemctl enable --now bluetooth.service
