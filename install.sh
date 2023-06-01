#!/bin/bash
#set -e
echo "##########################################"
echo "Be Careful this will override your Rice!! "
echo "##########################################"
sleep 5
echo
echo "Creating Backup of ~/.config folder"
echo "#####################################"
cp -r ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
sleep 2
echo
echo "Backing up current XeroASCII      "
echo "##################################"
# Check if XeroAscii.old file exists in /etc/
if [ -f "$HOME/XeroAscii.old" ]; then
    echo "Deleting existing XeroAscii.old file..."
    sudo rm $HOME/XeroAscii.old
fi
# Rename XeroAscii toXero Ascii.old
if [ -f "$HOME/XeroAscii" ]; then
    echo "Renaming XeroAscii to XeroAscii.old..."
    sudo mv $HOME/XeroAscii $HOME/XeroAscii.old
fi
echo
echo "Installing Necessary Packages    "
echo "#################################"
# Check if lightly-git and latte-dock exist
if pacman -Qs lightly-git && pacman -Qs latte-dock; then
  # Remove lightly-git and latte-dock
  sudo pacman -Rns --noconfirm --needed lightly-git latte-dock > /dev/null 2>&1
  
  # Install latte-dock-git and kvantum
  sudo pacman -S latte-dock-git kvantum --noconfirm --needed
fi

# Check if any of the specified packages are installed and install them if not present
packages="gtk-engine-murrine gtk-engines tela-circle-icon-theme-purple-git ttf-hack-nerd ttf-fira-code ttf-meslo-nerd-font-powerlevel10k ttf-terminus-nerd noto-fonts-emoji"
echo
echo "Installing required packages..."
for package in $packages; do
    pacman -Qi "$package" > /dev/null 2>&1 || sudo pacman -Syy --noconfirm --needed "$package" > /dev/null 2>&1
done
sleep 2
echo
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sudo cp -Rf Configs/System/. /
sudo cp -Rf Configs/Home/. /root/
sudo sed -i "s/Current=.*/Current=XeroDark/" /etc/sddm.conf.d/kde_settings.conf
sleep 2
echo
echo "Applying Grub Theme...."
echo "#################################"
chmod +x CyberRe.sh
sudo ./CyberRe.sh
sudo sed -i "s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo
echo "Applying New XeroASCII...."
echo "#################################"
cd ~ && wget https://raw.githubusercontent.com/xerolinux/xero-fixes/main/conf/XeroAscii
echo
echo "Installing Layan Theme"
echo "#################################"
echo
cd ~ && git clone https://github.com/vinceliuice/Layan-kde.git && cd Layan-kde/ && sh install.sh
cd ~ && rm -rf Layan-kde/
sleep 2
echo
echo "Installing & Applying GTK4 Theme "
echo "#################################"
cd ~ && git clone https://github.com/vinceliuice/Layan-gtk-theme.git && cd Layan-gtk-theme/ && sh install.sh -l -c dark
cd ~ && rm -Rf Layan-gtk-theme/
echo
echo
echo "Applying Flatpak Theme Fix..."
echo "#################################"
sh /usr/local/bin/stylepak install-system Layan-Dark
sleep 2
echo
echo "Plz Reboot To Apply Settings..."
echo "#################################"
