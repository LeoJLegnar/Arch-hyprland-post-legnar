#!/bin/bash
set -e

echo "🚀 Aplicando optimizaciones para Ryzen 7 7800X3D + RTX 5080..."

# --------------------------
# 🧠 Governor de CPU y energía
# --------------------------
echo "🧠 Estableciendo governor de CPU a schedutil..."
sudo pacman -S --noconfirm cpupower
sudo systemctl enable --now cpupower.service
sudo bash -c 'echo "governor=\"schedutil\"" > /etc/default/cpupower'

echo "💤 Activando ahorro energético con TLP..."
sudo pacman -S --noconfirm tlp
sudo systemctl enable --now tlp.service

# --------------------------
# 🌡️ Control de temperatura y sensores
# --------------------------
echo "🌡️ Instalando y configurando sensores..."
sudo pacman -S --noconfirm lm_sensors
sudo sensors-detect --auto || true

# --------------------------
# ❄️ Ajustes térmicos para ITX con AIO 140mm
# --------------------------
echo "🧊 Configurando límites térmicos con RyzenAdj..."
yay -S --noconfirm ryzenadj-git
sudo tee /etc/systemd/system/ryzenadj.service >/dev/null <<EOF
[Unit]
Description=RyzenAdj undervolt and temp cap
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/ryzenadj --tctl-temp=80 --stapm-limit=88000 --fast-limit=88000 --slow-limit=75000

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable ryzenadj.service

# --------------------------
# 🖥️ NVIDIA RTX 5080 Optimización
# --------------------------
echo "🖥️ Instalando driver NVIDIA y configurando entorno..."
sudo pacman -S --noconfirm nvidia-dkms nvidia-utils nvidia-settings
sudo bash -c 'echo "options nvidia NVreg_PreserveVideoMemoryAllocations=1 NVreg_EnableGpuFirmware=0" > /etc/modprobe.d/nvidia.conf'

mkdir -p ~/.config/hypr
cat <<EOF >> ~/.config/hypr/hyprland.conf

# NVIDIA: Fix tearing y habilita triple buffer
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
# 💾 SSD NVMe Optimización
# --------------------------
echo "💾 Activando TRIM y mejoras para NVMe..."
sudo systemctl enable fstrim.timer

if mount | grep -q "btrfs"; then
  echo "📦 Activando compresión zstd para Btrfs..."
  sudo btrfs property set -ts / compress zstd
fi

# --------------------------
# 🧠 RAM optimización con ZRAM
# --------------------------
echo "🧠 Activando ZRAM..."
yay -S --noconfirm systemd-zram-generator
sudo tee /etc/systemd/zram-generator.conf >/dev/null <<EOF
[zram0]
zram-size = ram
compression-algorithm = zstd
EOF

# --------------------------
# 🎮 Gaming Tools
# --------------------------
echo "🎮 Instalando herramientas de optimización para gaming..."
yay -S --noconfirm gamemode mangohud wine winetricks vkd3d

echo "🎮 Configurando Gamemode..."
sudo systemctl enable --now gamemoded.service

# --------------------------
# 🧼 Pacman tweaks y limpieza
# --------------------------
echo "🧼 Mejorando pacman.conf..."
sudo sed -i 's/^#ParallelDownloads.*/ParallelDownloads = 10/' /etc/pacman.conf
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#CheckSpace/CheckSpace/' /etc/pacman.conf
sudo sed -i 's/^#VerbosePkgLists/VerbosePkgLists/' /etc/pacman.conf
sudo bash -c 'echo "ILoveCandy" >> /etc/pacman.conf'

echo "🧹 Limpiando paquetes huérfanos..."
yay -Yc --noconfirm || true

echo "✅ Optimización completada. Reinicia para aplicar todos los cambios."
