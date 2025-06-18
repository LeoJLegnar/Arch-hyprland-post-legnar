#!/bin/bash

set -e

echo "🔧 Actualizando el sistema..."
sudo pacman -Syu --noconfirm

echo "📡 Optimización de mirrors con Reflector..."
sudo pacman -S --noconfirm reflector
sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

echo "📦 Instalando paquetes base..."
sudo pacman -S --noconfirm \
  git base-devel curl wget unzip \
  hyprland xdg-desktop-portal-hyprland \
  polkit-kde-agent pipewire pipewire-pulse wireplumber \
  wl-clipboard grim slurp wf-recorder swaylock swayidle \
  qt5-wayland qt6-wayland qt5ct qt6ct \
  gvfs gvfs-mtp thunar thunar-volman thunar-archive-plugin \
  gnome-disk-utility file-roller gparted

echo "⚙️ Instalando yay..."
if ! command -v yay &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

echo "📥 Instalando flatpak y pamac..."
sudo pacman -S --noconfirm flatpak
yay -S --noconfirm pamac-aur

echo "🔤 Instalando fuentes necesarias (incluye Microsoft)..."
sudo pacman -S --noconfirm ttf-liberation ttf-dejavu noto-fonts noto-fonts-cjk noto-fonts-emoji
yay -S --noconfirm ttf-ms-fonts

echo "🎨 Instalando programas creativos..."
yay -S --noconfirm krita blender wps-office

echo "💻 Instalando herramientas de desarrollo..."
yay -S --noconfirm visual-studio-code-bin

echo "📹 Instalando herramientas de streaming y multimedia..."
sudo pacman -S --noconfirm obs-studio vlc
flatpak install -y flathub com.spotify.Client

echo "🎮 Instalando apps de gaming..."
sudo pacman -S --noconfirm steam lutris
yay -S --noconfirm heroic-games-launcher minecraft-launcher bottles

echo "📡 Instalando comunicación y control..."
sudo pacman -S --noconfirm discord kdeconnect
yay -S --noconfirm vencord-desktop-bin

echo "🎨 Instalando drivers de Xencelabs..."
yay -S --noconfirm xencelabs-driver

#echo "🌈 Instalando programa para RGB y ventiladores..."
#yay -S --noconfirm openrgb

echo "🎵 Configurando Spicetify..."
yay -S --noconfirm spicetify-cli
spicetify backup apply || true

echo "🖥️ Instalando cool-retro-term..."
yay -S --noconfirm cool-retro-term

echo "🎧 Instalando Endel (versión Flatpak)..."
flatpak install -y com.endel.Endel

echo "📝 Instalando AFFiNE..."
flatpak install -y flathub cloud.affine.APP

echo "📊 Instalando herramientas de sistema..."
sudo pacman -S --noconfirm htop btop fastfetch

echo "📂 Instalando dotfiles de End-4..."
bash <(curl -s https://raw.githubusercontent.com/End-4/dotfiles/main/install.sh)

echo "🌐 Configurando DNS de AdGuard..."
sudo bash -c 'echo "nameserver 94.140.14.14" > /etc/resolv.conf'
sudo chattr +i /etc/resolv.conf

echo "⌨️ Configurando teclado inglés con ñ..."
localectl set-x11-keymap us "" "" "grp:alt_shift_toggle,lv3:ralt_switch"

echo "🔡 Añadiendo keybinds personalizados..."
CONFIG_FILE="$HOME/.config/hypr/hyprland.conf"
mkdir -p "$(dirname "$CONFIG_FILE")"
touch "$CONFIG_FILE"

cat <<EOF >> "$CONFIG_FILE"

# Atajos personalizados para apps (SUPER+CTRL+letra)
bind=SUPER,CTRL,K,exec,krita
bind=SUPER,CTRL,B,exec,blender
bind=SUPER,CTRL,W,exec,wps
bind=SUPER,CTRL,V,exec,code
bind=SUPER,CTRL,O,exec,obs
bind=SUPER,CTRL,S,exec,steam
bind=SUPER,CTRL,H,exec,heroic
bind=SUPER,CTRL,M,exec,minecraft-launcher
bind=SUPER,CTRL,L,exec,lutris
bind=SUPER,CTRL,T,exec,bottles
bind=SUPER,CTRL,D,exec,discord
bind=SUPER,CTRL,P,exec,spotify
bind=SUPER,CTRL,C,exec,vlc
bind=SUPER,CTRL,F,exec,fastfetch
bind=SUPER,CTRL,A,exec,flatpak run cloud.affine.APP
bind=SUPER,CTRL,R,exec,cool-retro-term
bind=SUPER,CTRL,E,exec,flatpak run com.endel.Endel
EOF

echo "✅ Script completado con éxito. Reinicia tu sistema para aplicar todos los cambios."
