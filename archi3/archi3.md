# Install Arch + i3 (June 12, 2021)

## Archfi
- Download Arch iso from [here](http://mirror.bizflycloud.vn/archlinux/iso/2021.06.01/archlinux-2021.06.01-x86_64.iso)
- Burn to USB stick with [rufus](https://rufus.ie/en_US/). Must use dd mode instead of iso
- Boot to ArchLive using USB
- Use [iwctl](https://wiki.archlinux.org/title/Iwd) to connect Wifi
- Download Archfi script [Archfi](https://matmoul.github.io/archfi)
```
curl -LO https://matmoul.github.io/archfi
```
- Exec it 
```
bash archfi
```
- Partitions:
    - boot device should be in existing EFI partion from Windows (Dualboot)
    - `root partition` can be free to decide in any free partitions
- After installation, reboot and boot from `ArchLive` to get Wifi Access for fresh Arch.
- Mount `root partition` to /mnt
- arch-chroot to /mnt
- Install some tools
```
sudo pacman -S iwd neovim
```
- Exit and reboot to Arch
- Arch now has `iwctl` to use Wifi. Connect to known Wifi (Remember to enable dhcp for iwctl)
```
nv /etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true
```
- Install visudo
```
pacman -S visudo
```
- Enable Wheel group
```
EDITOR=nvim visudo
%wheel ALL=(ALL) ALL
```
- Add user
```
useradd -m kyle -p
```
- Add to Wheel
```
usermod -aG wheel kyle
```

## X11
```
pacman -S xorg-server xorg-xinit xorgs-apps xclock
```

## i3
- Install i3 i3lock
```
pacman -S i3 i3lock
```
- exec i3 in xinitrc
```
echo 'exec i3' >> ~/.xinitrc
echo 'xset r rate 200 20' >> ~/.xinitrc
```

## Lightdm
```
pacman -S lightdm lightdm--gtk-greeter
```

## Yay
- Use Yay to access AUR repo
```
git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
```
- Install chrome from Yay
```
yay -S google-chrome
```

## ibus-bamboo
- install ibus-bamboo
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/BambooEngine/ibus-bamboo/master/archlinux/install.sh)"
```
- make ibus run at startup
```
echo 'ibus-daemon -drx' >> /.zshrc
```

## Nvidia and Alsa (this can be skipped on laptops with Intel)
- Install linux-headers
```
pacman -S linux-headers
```
- Download nvidia driver from Nvidia web
- Turn off lightdm (this turn off X also)
```
systemctl stop lightdm
```
- ctrl + alt + f2 to switch to other console
- Exec downloaded nvidia driver (it will blacklist nouvou kernel driver)
- Reboot
- Install ALSA utils
```
pacman -S alsa-utils
this is 2 commands: alsactl and alsamixer
```
- List device to make sure which one is playing the sound
```
aplay -l
```
- set default sound card for Alsa
- use alsamixer to choose sound card and unmute if needed

## Fix nvidia x11 tearing
```
nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"
sudo nvidia-xsetting (to write to x11 config)
```

## xclip as pbcopy
```
pacman -S xclip
alias pbcopy='xclip -selection clipboard'
```

## emoj font for Chrome
```
pacman -S noto-fonts-emoji
yay -S ttf-ms-fonts
```

## fixes for Chrome
```
disable hardware accel to watch some website's videos (vtvgo.vn)
pacman -S ffmpeg (to play clips)
```
