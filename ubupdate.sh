#!/bin/bash
#Updates apt, snap, and flatpak, then checks firmware for updates, if any. Last step is doing some house cleaning.
echo "Updating APT..."
sudo apt update
sudo apt -y upgrade
echo "Updating Snap..."
sudo snap refresh
echo "Updating Flatpak..."
flatpak update
echo "Checking Firmware..."
echo "BIOS Version and Release Date:"
sudo dmidecode -s bios-version
sudo dmidecode -s bios-release-date
sudo systemctl start fwupd
fwupdmgr get-updates
echo "Cleaning up..."
sudo apt clean && sudo apt autoremove
sudo apt-get autopurge
echo "Nerd."
