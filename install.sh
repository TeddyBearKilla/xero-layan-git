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
# Check if pacman.conf.old file exists in /etc/
if [ -f "$HOME/XeroAscii.old" ]; then
    echo "Deleting existing XeroAscii.old file..."
    sudo rm $HOME/XeroAscii.old
fi
# Rename pacman.conf to pacman.conf.old
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
  sudo pacman -Rns lightly-git latte-dock --noconfirm
  
  # Install latte-dock-git and kvantum
  sudo pacman -S latte-dock-git kvantum --noconfirm
fi
sleep 2
echo
echo "Installing Layan Theme"
echo "#################################"
# Check and install theme packages if they don't exist
if ! pacman -Qs layan-gtk-theme-git; then
  sudo pacman -S layan-gtk-theme-git --noconfirm
fi

if ! pacman -Qs layan-kde-git; then
  sudo pacman -S layan-kde-git --noconfirm
fi

if ! pacman -Qs tela-circle-icon-theme-purple-git; then
  sudo pacman -S tela-circle-icon-theme-purple-git --noconfirm
fi
sleep 2
echo
echo "Installing Fonts"
echo "#################################"
# Install font packages if they don't exist
if ! pacman -Qs ttf-hack-nerd; then
  sudo pacman -S ttf-hack-nerd --noconfirm
fi

if ! pacman -Qs ttf-fira-code; then
  sudo pacman -S ttf-fira-code --noconfirm
fi

if ! pacman -Qs ttf-meslo-nerd-font-powerlevel10k; then
  sudo pacman -S ttf-meslo-nerd-font-powerlevel10k --noconfirm
fi

if ! pacman -Qs ttf-terminus-nerd; then
  sudo pacman -S ttf-terminus-nerd --noconfirm
fi

if ! pacman -Qs noto-fonts-emoji; then
  sudo pacman -S noto-fonts-emoji --noconfirm
fi
sleep 2
echo
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sudo cp -Rf Configs/System/. /
sed -i "s/{.*}/{C1}/g" ~/XeroAscii
sudo sed -i "s/Current=.*/Current=XeroDark/" /etc/sddm.conf.d/kde_settings.conf
sleep 2
echo
echo "Applying Flatpak Theme Fix..."
echo "#################################"
sh /usr/local/bin/stylepak install-system Layan-Dark
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
echo "Plz Reboot To Apply Settings..."
echo "#################################"
