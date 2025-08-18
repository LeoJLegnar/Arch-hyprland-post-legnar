#!/bin/bash

set -e

echo "🔧 Actualizando el sistema..."
sudo pacman -Syu --noconfirm

echo "📡 Optimización de mirrors con Reflector..."
sudo pacman -S --noconfirm reflector
sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

echo "📦 Instalando paquetes base..."
sudo pacman -S --noconfirm  curl wget gcc make cmake nano vim

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
yay -S visual-studio-code-bin

echo "🇯🇵 tus monas chinas sucio otaku..."
yay -S shiru

echo "📹 Instalando herramientas de streaming y multimedia..."
sudo pacman -S --noconfirm obs-studio vlc

echo "🎶 Instalando YouTube Music..."
yay -S --noconfirm youtube-music-bin

echo "🎮 Instalando apps de gaming..."
sudo pacman -S --noconfirm steam lutris
yay -S --noconfirm heroic-games-launcher minecraft-launcher bottles

echo "📡 Instalando comunicación y control..."
sudo pacman -S --noconfirm discord kdeconnect
yay -S --noconfirm vencord-desktop-bin

echo "🎨 Instalando drivers de Xencelabs..."
yay -S --noconfirm xencelabs-driver

echo "📝 Instalando AFFiNE..."
flatpak install -y flathub cloud.affine.APP

echo "📊 Instalando herramientas de sistema..."
sudo pacman -S --noconfirm htop btop fastfetch

echo "📂 Instalando dotfiles de End-4..."
bash <(curl -s "https://end-4.github.io/dots-hyprland-wiki/setup.sh")

echo "🌐 Configurando DNS de AdGuard..."
sudo bash -c 'echo "nameserver 94.140.14.14" > /etc/resolv.conf'
sudo chattr +i /etc/resolv.conf

echo "⌨️ Configurando teclado inglés con ñ..."
localectl set-x11-keymap us "" "" "grp:alt_shift_toggle,lv3:ralt_switch"

echo "🔡 Añadiendo keybinds personalizados..."
KEYBINDS_FILE="$HOME/.config/hypr/hyprland/keybinds.conf"
mkdir -p "$(dirname "$KEYBINDS_FILE")"
touch "$KEYBINDS_FILE"

cat <<EOF >> "$KEYBINDS_FILE"

# Atajos personalizados para apps (SUPER+CTRL+letra)
bind = Super+Ctrl, K, exec, Krita
bind = Super+Ctrl, B, exec, Blender
bind = Super+Ctrl, W, exec, Wps
bind = Super+Ctrl, V, exec, Code
bind = Super+Ctrl, O, exec, Obs
bind = Super+Ctrl, S, exec, Steam
bind = Super+Ctrl, H, exec, Heroic
bind = Super+Ctrl, M, exec, Minecraft-launcher
bind = Super+Ctrl, L, exec, Lutris
bind = Super+Ctrl, T, exec, Bottles
bind = Super+Ctrl, D, exec, Discord
bind = Super+Ctrl, Y, exec, Youtube-music
bind = Super+Ctrl, C, exec, Vlc
bind = Super+Ctrl, F, exec, Fastfetch
bind = Super+Ctrl, A, exec, flatpak run cloud.affine.APP
bind = Super+Ctrl, E, exec, Shiru
EOF

echo "🖥️ Instalando y activando SDDM..."
sudo pacman -S --noconfirm sddm
sudo systemctl enable sddm

echo "✅ Script completado con éxito. Reinicia tu sistema para aplicar todos los cambios."
