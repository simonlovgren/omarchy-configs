#!/bin/bash
VPN_CONFIG=$(cat ~/.config/waybar/vpn.conf 2>/dev/null || echo "wg0")
if ip link show "$VPN_CONFIG" &> /dev/null; then
    notify-send "VPN" "Please disconnect from $VPN_CONFIG before changing the VPN config." -i network-vpn
else
    omarchy-launch-floating-terminal-with-presentation ~/.config/waybar/scripts/vpn-select-popup.sh
fi
