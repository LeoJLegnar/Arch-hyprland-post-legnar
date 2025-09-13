#!/bin/bash

set -e

# ────────────────────────────────
# 🎨 ASCII + ADVERTENCIA
# ────────────────────────────────
clear
cat <<'EOF'
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⡿⠿⢿⣦⡀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣶⣿⣶⣶⣶⣦⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠟⠁⣀⣤⡄⢹⣷⡀⠀⠀⠀⠀⠀
⠀⠀⢸⣿⡧⠤⠤⣌⣉⣩⣿⡿⠶⠶⠒⠛⠛⠻⠿⠶⣾⣿⣣⠔⠉⠀⠀⠙⡆⢻⣷⠀⠀⠀⠀⠀
⠀⠀⢸⣿⠀⠀⢠⣾⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡃⠀⠀⠀⠀⠀⢻⠘⣿⡀⠀⠀⠀⠀
⠀⠀⠘⣿⡀⣴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢶⣤⣀⠀⢘⠀⣿⡇⠀⠀⠀⠀
⠀⠀⠀⢿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⢿⣴⣿⠀⠀⠀⠀⠀
⠀⠀⠀⣸⡟⠀⠀⠀⣴⡆⠀⠀⠀⠀⠀⠀⠀⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⡀⠀⠀⠀⠀
⠀⠀⢰⣿⠁⠀⠀⣰⠿⣇⠀⠀⠀⠀⠀⠀⠀⢻⣷⡀⠀⢠⡄⠀⠀⠀⠀⠀⡀⠀⠹⣷⠀⠀⠀⠀
⠀⠀⣾⡏⠀⢀⣴⣿⣤⢿⡄⠀⠀⠀⠀⠀⠀⠸⣿⣷⡀⠘⣧⠀⠀⠀⠀⠀⣷⣄⠀⢻⣇⠀⠀⠀
⠀⠀⢻⣇⠀⢸⡇⠀⠀⠀⢻⣄⠀⠀⠀⠀⠀⣤⡯⠈⢻⣄⢻⡄⠀⠀⠀⠀⣿⡿⣷⡌⣿⡄⠀⠀
⠀⢀⣸⣿⠀⢸⡷⣶⣶⡄⠀⠙⠛⠛⠛⠛⠛⠃⣠⣶⣄⠙⠿⣧⠀⠀⠀⢠⣿⢹⣻⡇⠸⣿⡄⠀
⢰⣿⢟⣿⡴⠞⠀⠘⢿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⡇⠀⣿⡀⢀⣴⠿⣿⣦⣿⠃⠀⢹⣷⠀
⠀⢿⣿⠁⠀⠀⠀⠀⠀⠀⠀⢠⣀⣀⡀⠀⡀⠀⠀⠀⠀⠀⠀⣿⠛⠛⠁⠀⣿⡟⠁⠀⠀⢀⣿⠂
⠀⢠⣿⢷⣤⣀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠉⠀⠀⠀⠀⠀⢠⡿⢰⡟⠻⠞⠛⣧⣠⣦⣀⣾⠏⠀
⠀⢸⣿⠀⠈⢹⡿⠛⢶⡶⢶⣤⣤⣤⣤⣤⣤⣤⣤⣶⠶⣿⠛⠷⢾⣧⣠⡿⢿⡟⠋⠛⠋⠁⠀⠀
⠀⣾⣧⣤⣶⣟⠁⠀⢸⣇⣸⠹⣧⣠⡾⠛⢷⣤⡾⣿⢰⡟⠀⠀⠀⣿⠋⠁⢈⣿⣄⠀⠀⠀⠀⠀
⠀⠀⠀⣼⡏⠻⢿⣶⣤⣿⣿⠀⠈⢉⣿⠀⢸⣏⠀⣿⠈⣷⣤⣤⣶⡿⠶⠾⠋⣉⣿⣦⣀⠀⠀⠀
⠀⠀⣼⡿⣇⠀⠀⠙⠻⢿⣿⠀⠀⢸⣇⠀⠀⣻⠀⣿⠀⣿⠟⠋⠁⠀⠀⢀⡾⠋⠉⠙⣿⡆⠀⠀
⠀⠀⢻⣧⠙⢷⣤⣦⠀⢸⣿⡄⠀⠀⠉⠳⣾⠏⠀⢹⣾⡇⠀⠀⠙⠛⠶⣾⡁⠀⠀⠀⣼⡇⠀⠀
⠀⠀⠀⠙⠛⠛⣻⡟⠀⣼⣿⣇⣀⣀⣀⡀⠀⠀⠀⣸⣿⣇⠀⠀⠀⠀⠀⠈⢛⣷⠶⠿⠋⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣿⣅⣠⣿⠛⠋⠉⠉⠛⠻⠛⠛⠛⠛⠋⠻⣧⡀⣀⣠⢴⠾⠉⣿⣆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣼⡏⠉⣿⡟⠁⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣌⠁⠀⠀⠈⣿⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣿⣇⣠⣿⣿⡶⠶⠶⣶⣿⣷⡶⣶⣶⣶⣶⡶⠶⠶⢿⣿⡗⣀⣤⣾⠟⠁⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠈⠙⠛⢻⣿⡇⠀⠀⣿⡟⠛⠷⠶⠾⢿⣧⠁⠀⠀⣸⡿⠿⠟⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣷⣦⣤⡿⠀⠀⠀⠀⠀⠀⢿⣧⣤⣼⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
  ======================================
       Script potinstalación y ajustes
         ⚠️ ADVERTENCIA IMPORTANTE ⚠️
  --------------------------------------
  - Este script está diseñado para uso
    personal en una instalación mínima
    de Arch Linux con entorno de
    escritorio hyprland.
  - Hará cambios importantes en tu sistema.
  - Instalará programas, y sobreescribirá
         configuraciones.
  - Si no sabes lo que hace, detente aquí.
EOF

echo ""
read -rp "¿Deseas ejecutar este script? (s/n): " RESPUESTA
if [[ ! "$RESPUESTA" =~ ^[sS]$ ]]; then
  echo "❌ Ejecución cancelada. No se hicieron cambios."
  exit 0
fi

echo "✅ Continuando con la instalación..."
sleep 2

# ────────────────────────────────
# 🔧 Actualización inicial
# ────────────────────────────────
echo "🔧 Actualizando el sistema..."
sudo pacman -Syu --noconfirm

echo "📡 Optimización de mirrors con Reflector..."
sudo pacman -S --noconfirm reflector
sudo reflector --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# ────────────────────────────────
# 📦 Paquetes base
# ────────────────────────────────
echo "📦 Instalando paquetes base..."
sudo pacman -S --noconfirm curl wget gcc make cmake nano vim firefox

# ────────────────────────────────
# ⚙️ Yay (AUR Helper)
# ────────────────────────────────
echo "⚙️ Instalando yay..."
if ! command -v yay &>/dev/null; then
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
fi

# ────────────────────────────────
# 📥 Flatpak + Pamac
# ────────────────────────────────
echo "📥 Instalando flatpak y pamac..."
sudo pacman -S --noconfirm flatpak
yay -S --noconfirm pamac-aur

echo "🌍 Añadiendo Flathub como repositorio de Flatpak..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ────────────────────────────────
# 🔤 Fuentes
# ────────────────────────────────
echo "🔤 Instalando fuentes necesarias (incluye Microsoft)..."
sudo pacman -S --noconfirm ttf-liberation ttf-dejavu noto-fonts noto-fonts-cjk noto-fonts-emoji
yay -S --noconfirm ttf-ms-fonts

# ────────────────────────────────
# 🎨 Creatividad
# ────────────────────────────────
echo "🎨 Instalando programas creativos..."
yay -S --noconfirm krita blender wps-office

echo "🇯🇵 tus monas chinas sucio otaku..."
yay -S --noconfirm shiru

# ────────────────────────────────
# 📹 Streaming / Multimedia
# ────────────────────────────────
echo "📹 Instalando herramientas de streaming y multimedia..."
sudo pacman -S --noconfirm obs-studio vlc

echo "🎶 Instalando YouTube Music..."
yay -S --noconfirm youtube-music-bin

echo "📺 Instalando Stremio..."
yay -S --noconfirm stremio

echo "📚 Instalando Komikku (lector de manga)..."
flatpak install -y flathub info.febvre.Komikku

# ────────────────────────────────
# 🎮 Gaming
# ────────────────────────────────
echo "🎮 Instalando apps de gaming..."
sudo pacman -S --noconfirm steam lutris
yay -S --noconfirm heroic-games-launcher minecraft-launcher bottles

# ────────────────────────────────
# 📡 Comunicación
# ────────────────────────────────
echo "📡 Instalando comunicación y control..."
sudo pacman -S --noconfirm discord kdeconnect scrcpy
yay -S --noconfirm vencord-desktop-bin

# ────────────────────────────────
# 🔐 Seguridad / Contraseñas
# ────────────────────────────────
echo "🔐 Instalando KeePassXC..."
sudo pacman -S --noconfirm keepassxc

# ────────────────────────────────
# 🎨 Drivers tablet
# ────────────────────────────────
echo "🎨 Instalando drivers de Xencelabs..."
yay -S --noconfirm xencelabs-driver

# ────────────────────────────────
# 📝 Apps extra
# ────────────────────────────────
echo "📝 Instalando Obsidian..."
flatpak install -y flathub md.obsidian.Obsidian

# ────────────────────────────────
# 📊 Herramientas de sistema
# ────────────────────────────────
echo "📊 Instalando herramientas de sistema..."
sudo pacman -S --noconfirm htop btop fastfetch

# ────────────────────────────────
# 📂 Dotfiles
# ────────────────────────────────
echo "📂 Instalando dotfiles de End-4..."
bash <(curl -s "https://end-4.github.io/dots-hyprland-wiki/setup.sh")

# ────────────────────────────────
# 🌐 DNS
# ────────────────────────────────
echo "🌐 Configurando DNS de AdGuard..."
sudo bash -c 'echo "nameserver 94.140.14.14" > /etc/resolv.conf'
sudo chattr +i /etc/resolv.conf

# ────────────────────────────────
# ⌨️ Teclado
# ────────────────────────────────
echo "⌨️ Configurando teclado inglés con ñ..."
localectl set-x11-keymap us "" "" "grp:alt_shift_toggle,lv3:ralt_switch"

# ────────────────────────────────
# 🔡 Keybinds Hyprland
# ────────────────────────────────
echo "🔡 Añadiendo keybinds personalizados..."
KEYBINDS_FILE="$HOME/.config/hypr/hyprland/keybinds.conf"
mkdir -p "$(dirname "$KEYBINDS_FILE")"
touch "$KEYBINDS_FILE"

cat <<EOF >> "$KEYBINDS_FILE"

# Atajos personalizados para apps (SUPER+CTRL+letra)
bind = Super+Ctrl, K, exec, Krita
bind = Super+Ctrl, B, exec, Blender
bind = Super+Ctrl, W, exec, Wps
bind = Super+Ctrl, V, exec, Vlc
bind = Super+Ctrl, O, exec, Obs
bind = Super+Ctrl, S, exec, Steam
bind = Super+Ctrl, H, exec, Heroic
bind = Super+Ctrl, M, exec, Minecraft-launcher
bind = Super+Ctrl, L, exec, Lutris
bind = Super+Ctrl, T, exec, Bottles
bind = Super+Ctrl, D, exec, Discord
bind = Super+Ctrl, Y, exec, Youtube-music
bind = Super+Ctrl, F, exec, Fastfetch
bind = Super+Ctrl, O, exec, flatpak run md.obsidian.Obsidian
bind = Super+Ctrl, A, exec, Shiru
bind = Super+Ctrl, G, exec, keepassxc
bind = Super+Ctrl, R, exec, Stremio
bind = Super+Ctrl, P, exec, scrcpy
bind = Super+Ctrl, N, exec, flatpak run info.febvre.Komikku
EOF

# ────────────────────────────────
# 🖥️ Display Manager
# ────────────────────────────────
echo "🖥️ Instalando tema a SDDM..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

echo "✅ Script completado con éxito. Reinicia tu sistema para aplicar todos los cambios."
