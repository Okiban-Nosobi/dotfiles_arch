#!/bin/bash
SCRIPT_PATH=$PWD
echo "Updating system and reference before starting"

sudo pacman -Syu --noconfirm

echo "installing tools..."

# install stuffs
sudo pacman -S i3-wm sddm alacritty neofetch rofi dunst polybar wget curl lsb-release networkmanager network-manager-applet less nm-connection-editor wireless_tools wpa_supplicant bluez bluez-utils plocate git base-devel man dosfstools feh picom vi zsh procs xclip lsd lxappearance thunar noto-fonts noto-fonts-emoji qt5-graphicaleffects qt5-quickcontrols2 qt5-svg cargo thefuck fd discord firefox xorg-xrandr neovim go timeshift ffmpeg yt-dlp ripgrep bat htop ncdu dust jq python python-pipx --noconfirm
sudo pacman -S --needed git base-devel --noconfirm && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ..

yay -S xcursor-breeze catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato brave-bin ttf-symbola snapd --noconfirm
    
# no idea why it has been installed 
sudo pacman -R fontforge

# enable snap package manager
sudo systemctl enable snapd
sudo systemctl start snapd

echo "Installing spotify and stuff using snap"
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install spotify steam 
sudo snap install code --classic

# enable sddm 
sudo systemctl enable sddm

# setup theme
sudo mkdir -p /usr/share/sddm/themes
sudo cp $SCRIPT_PATH/sddm/sddm.conf /etc
sudo cp -r $SCRIPT_PATH/sddm/sugar-candy /usr/share/sddm/themes

# CHANGE SCREENwidth:height WITH THE SIZE SCREEN TO FIT BETTER (1920x1080)
# IN theme.conf
echo "Backuping current config"

if ! [ -d $HOME/.config ]; then
   cp -r -p $HOME/.config $HOME/.config.bak
fi

# ALACRITTY
echo "Installing configs/themes..."
cp -r $SCRIPT_PATH/.config $HOME

mkdir -p $HOME/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme $HOME/.config/alacritty/themes

# Install font
echo "Installing font..."

sudo mkdir -p /usr/share/fonts/TTF/
sudo cp -r $SCRIPT_PATH/fonts/Caskaydia /usr/share/fonts/TTF/
fc-cache

echo "Installing rofi..."
mkdir -p $HOME/.local/share/rofi
cp -r $SCRIPT_PATH/rofi/themes $HOME/.local/share/rofi

echo "Installing picom..."
sudo mkdir -p /usr/share/backgrounds/
sudo cp $SCRIPT_PATH/picom.conf /etc/xdg/picom.conf

echo "Installing wallpapers"

sudo cp $SCRIPT_PATH/wallpapers/current_wallpaper.jpg /usr/share/backgrounds

# Install oh-my-zsh
echo "Installing omz..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $SCRIPT_PATH/zsh_config/.zshrc $HOME
cp $SCRIPT_PATH/zsh_config/.bash_aliases $HOME
cp $SCRIPT_PATH/zsh_config/okiban-nosobi.zsh-theme $HOME/.oh-my-zsh/themes

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo -n "\n\n\n"
echo "do source $HOME/.zshrc"
echo "Don't forget to adapt screen scaled and the title "headerText" in /usr/share/sddm/themes/sugar-candy/theme.conf"
echo "select rofi theme with rofi-theme-selector"
echo "select widget theme, cursor, ... with lxappearance"
echo "select Catpuccin-Macchiato-Standard-Lavender-dark, breeze dark, breeze cursor"

sleep 10
reboot
