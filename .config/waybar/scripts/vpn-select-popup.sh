#!/bin/bash

# Takes a list of <vpn_name>:<description> from vpn-choices.conf
vpn_choice=$(cat ~/.config/waybar/vpn-choices.conf | gum filter --height 20 --header "Select VPN" | cut -d":" -f1) || exit 1
echo "$vpn_choice" > ~/.config/waybar/vpn.conf
notify-send "VPN" "Changed to $vpn_choice"

~/.config/waybar/scripts/vpn-toggle.sh
