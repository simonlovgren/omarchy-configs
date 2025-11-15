#!/bin/bash
VPN_CONFIG=$(cat ~/.config/waybar/vpn.conf 2>/dev/null || echo "wg0")
if ip link show "$VPN_CONFIG" &> /dev/null; then
    notify-send "VPN" "Please disconnect from $VPN_CONFIG before changing the VPN config." -i network-vpn
    exit 1
fi

# Takes a list of <vpn_name>:<description> from vpn-choices.conf
vpn_choice=$(cat ~/.config/waybar/vpn-choices.conf | gum filter --height 20 --header "Select VPN" | cut -d":" -f1) || exit 1
echo "$vpn_choice" > ~/.config/waybar/vpn.conf
echo "VPN config set to $vpn_choice"
