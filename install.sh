#!/bin/bash
#set -e
echo "##########################################"
echo "Be Careful this will override your Rice!! "
echo "##########################################"
sleep 5
echo "Creating Backups of ~/.config folder"
echo "#####################################"
cp -r ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
sleep 2
echo "Removing old Latte-Dock & Lightly"
echo "#################################"
sudo pacman -R --noconfirm lightly-git
sudo pacman -R --noconfirm latte-dock
sleep 2
echo
echo "Installing New latte-Git version"
echo "#################################"
sudo pacman -S --needed --noconfirm latte-dock-git kvantum
sleep 2
echo "Installing Layan Theme"
echo "#################################"
sudo pacman -S --needed --noconfirm layan-gtk-theme-git layan-kde-git tela-purple-icon-theme-git
sleep 2
echo "Installing Fonts"
echo "#################################"
sudo pacman -S --needed --noconfirm ttf-hack-nerd nerd-fonts-fira-code ttf-meslo-nerd-font-powerlevel10k ttf-terminus-nerd noto-fonts-emoji
sleep 2
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sudo cp -Rf Configs/System/. /
sed -i "s/{.*}/{C1}/g" ~/XeroAscii
sudo sed -i "s/Current=.*/Current=XeroDark/" /etc/sddm.conf.d/kde_settings.conf
sleep 2
echo "Applying Flatpak Theme Fix..."
echo "#################################"
cp -r /usr/share/themes/Layan-Dark ~/.themes/
sleep 2
echo "Applying Grub Theme...."
echo "#################################"
chmod +x CyberRe.sh
sudo ./CyberRe.sh
sudo sed -i "s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo "RebootTo Apply Settings..."
echo "#################################"
