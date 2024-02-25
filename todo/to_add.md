razer
=====
polychromatic
snake

gestion batterie
================
script et descriptions services/timers et faire faire beepbeep quand notif 

autres
======
volumeicon
protonvpn

smbclient
config redshift
gthumb

ajout fstab les mounts
recup la config pacman


betterlockscreen
` betterlockscreen -u /usr/share/backgrounds/ --display 1`

# sound
easy effects + calf + lsp-plugins
https://github.com/p-chan5/EasyPulse


yay -S xfce4 xfce4-goodies

xmousepasteblock

playerctl

copy 70-synaptics.conf => /etc/X11/xorg.conf.d/

# utils scripts

batterie alerte


# .desktop icon to be removed from rofi and added 
```bash
cd /usr/share/applications
sudo find . -name "in.lsp_plug.*" -exec mv {} {}.old \;
```


# /etc/locale.conf
If locales are not available, edit locale.gen file
`sudo vim /etc/locale.gen`

regenerate locale
`sudo locale-gen`
```

LANG="en_US.UTF-8"
LC_TIME="en_GB.UTF-8"
LC_COLLATE="C"
```
