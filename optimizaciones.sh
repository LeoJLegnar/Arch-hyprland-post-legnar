#!/bin/bash
set -e

echo "🚀 Aplicando optimizaciones para Ryzen 9 7950X + RTX 5080..."

# --------------------------
# 🧠 Governor de CPU y energía
# --------------------------
echo "🧠 Instalando cpupower con governor schedutil..."
sudo pacman -S --noconfirm cpupower
sudo systemctl enable --now cpupower.service
echo 'governor="schedutil"' | sudo tee /etc/default/cpupower

echo "⚡ Activando auto-cpufreq para mejor gestión energética..."
yay -S --noconfirm auto-cpufreq
sudo auto-cpufreq --install

# --------------------------
# 🌡️ Sensores
# --------------------------
echo "🌡️ Instalando sensores..."
sudo pacman -S --noconfirm lm_sensors
sudo sensors-detect --auto || true

# --------------------------
# ❄️ RyzenAdj para el 7950X con AIO 360mm
# --------------------------
echo "❄️ Configurando RyzenAdj..."
yay -S --noconfirm ryzenadj-git
sudo tee /etc/systemd/system/ryzenadj.service >/dev/null <<EOF
[Unit]
Description=RyzenAdj optimización térmica/potencia
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/ryzenadj --tctl-temp=90 --stapm-limit=105000 --fast-limit=105000 --slow-limit=95000

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable ryzenadj.service

# --------------------------
# 🖥️ NVIDIA RTX 5080
# --------------------------
echo "🖥️ Instalando driver NVIDIA y config Wayland..."
sudo pacman -S --noconfirm nvidia-dkms nvidia-utils nvidia-settings
sudo tee /etc/modprobe.d/nvidia.conf >/dev/null <<EOF
options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_EnableGpuFirmware=0
EOF

mkdir -p ~/.config/hypr
cat <<EOF >> ~/.config/hypr/hyprland.conf

# NVIDIA: Wayland fixes
env = __GL_VRR_ALLOWED=1
env = KWIN_TRIPLE_BUFFER=1
env = __GL_GSYNC_ALLOWED=1
env = WLR_DRM_NO_ATOMIC=1
env = GBM_BACKEND=nvidia-drm
env = LIBVA_DRIVER_NAME=nvidia
env = XDG_SESSION_TYPE=wayland
env = WLR_NO_HARDWARE_CURSORS=1
EOF

# --------------------------
# 💾 SSD NVMe
# --------------------------
echo "💾 Activando TRIM para SSD..."
sudo systemctl enable fstrim.timer

if mount | grep -q "btrfs"; then
  echo "📦 Activando compresión ZSTD en Btrfs..."
  sudo btrfs property set -ts / compress zstd
fi

# --------------------------
# 🧠 ZRAM
# --------------------------
echo "🧠 Activando ZRAM (uso eficiente de RAM)..."
yay -S --noconfirm systemd-zram-generator
sudo tee /etc/systemd/zram-generator.conf >/dev/null <<EOF
[zram0]
zram-size = 32G
compression-algorithm = zstd
EOF

# --------------------------
# 🎮 Gaming
# --------------------------
echo "🎮 Instalando herramientas de gaming..."
yay -S --noconfirm gamemode mangohud wine winetricks vkd3d
sudo systemctl enable --now gamemoded.service

# --------------------------
# 🧼 Pacman y limpieza
# --------------------------
echo "🧼 Optimizando pacman.conf..."
sudo sed -i 's/^#ParallelDownloads.*/ParallelDownloads = 10/' /etc/pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#CheckSpace/CheckSpace/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo grep -q "ILoveCandy" /etc/pacman.conf || echo "ILoveCandy" | sudo tee -a /etc/pacman.conf

echo "🧹 Limpiando paquetes huérfanos..."
yay -Yc --noconfirm || true

echo "✅ Optimización aplicada para el nuevo ensamble. Reinicia y disfruta tu bestia silenciosa."