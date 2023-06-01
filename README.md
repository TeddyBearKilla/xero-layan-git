# This is XeroLinux's Layan Rice

### Disclosure

> I would like to clarify one very important aspect of ricing. We use custom themes in every one of our rices, and those might not get updated very often, if at all by their respective developers/artists, which might result in some parts of the system and apps not to get themed correctly. That, my friends, is unfortunately out of our hands. In case that happens, kindly report back, we will check with them for any fixes/updates, if none are available, we will have no choice but to archive affected rice, and hide it, until fixes are applied and themes updated... 

![XeroLayan](https://i.imgur.com/HJyUDA3.jpeg)

-> Some notes before proceeding :

> Applying this rice will override all your settings. So make sure to create a backup of your system either via Snapper if using it, or TimeShift. Don't worry though, script will attempt to create a backup for you of your ~/.config folder before proceeding. Still better be safe than sorry.

-> Performance :

> This rice as with all rices has been throughly optimized for best performance.. If you have issues, kindly report them on our socials, Telegram/Discord.. we will try our best to help...

#### Installation

Just clone this repository, run terminal inside directory and run installer Script using below command.

`git clone https://github.com/xerolinux/xero-layan-git.git && cd xero-layan-git && ./install.sh`

### Reminder

Please follow the script instructions and answer some prompts with `y` when asked, if any, and select the right option for others. You might see a few errors pop up here n there, ignore them and let it do its thing. Once script is done your are urged to save any work you are doing and reboot for rice to be loaded and applied. Keep in mind that it will backup your app settings before applying and overriding them with new ones, so please do not report that. You have been warned. In case of any issues please find us on our [Discord Server](https://discord.gg/Xg6T78ahtK). Best of luck !

## Script will do the following steps :

- Create a backup of your ~/.config folder.
- Download and install necessary packages if needed...
- Override your settings and files with this rice's.
- Install and apply New Grub Theme...

# F.A.Q

> Q: Will this rice work on other distros Like Fedora or Debian based ?<br />
> A : If it's not **XeroLinux** then no. Sorry.
>
> Q : I am running *Pre-Customized* **Arch** Distro with *KDE* can I use your rice ?<br />
> A : Short answer, *might*. Long answer, too many variables, I don't guarantee success.
>
> Q : After applying this rice on **XeroLinux** nice ASCII in neofetch gone how to get it back ?<br />
> A : To get Xero ASCII in neofetch back just unhash line 114 in `config.conf` inside `/.config/neofetch/`
