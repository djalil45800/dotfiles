#!/bin/bash

bg='#1a1b26'
ring='#3b4261'
accent='#7aa2f7'
text='#c0caf5'
wrong='#f7768e'
verif='#9ece6a'

swaylock \
	--color "$bg" \
	--font "JetBrainsMono Nerd Font" \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--inside-color "$bg" \
	--ring-color "$ring" \
	--key-hl-color "$accent" \
	--text-color "$text" \
	--line-color 00000000 \
	--separator-color 00000000 \
	--inside-ver-color "$bg" \
	--ring-ver-color "$verif" \
	--inside-wrong-color "$bg" \
	--ring-wrong-color "$wrong" \
	--bs-hl-color "$wrong" \
	--caps-lock-bs-hl-color "$wrong" \
	--caps-lock-key-hl-color "$accent" \
	--verif-text "Checking..." \
	--wrong-text "Wrong!" \
	--no-unlock-indicator
