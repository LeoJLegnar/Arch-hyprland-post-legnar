#!/bin/bash

echo "🧠 Optimizando RAM, SSD y rendimiento general..."

# ZRAM
sudo pacman -S --noconfirm zram-generator
sudo tee /etc/systemd/zram-generator.conf > /dev/null <<EOF
[zram0]
zram-size = ram
compression-algorithm = zstd
EOF
sudo systemctl daemon-reexec
sudo systemctl restart systemd-zram-setup@zram0.service

# Swapfile mínimo
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab
sudo dd if=/dev/zero of=/swapfile bs=1M count=1024
sudo chmod 600 /swapfile
sudo mkswap /swapfile
echo '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab
sudo swapon /swapfile

# TRIM automático
sudo systemctl enable fstrim.timer

# Limitar logs de journald
sudo sed -i 's/^#SystemMaxUse=.*/SystemMaxUse=100M/' /etc/systemd/journald.conf
sudo sed -i 's/^#SystemKeepFree=.*/SystemKeepFree=50M/' /etc/systemd/journald.conf
sudo sed -i 's/^#RuntimeMaxUse=.*/RuntimeMaxUse=50M/' /etc/systemd/journald.conf
sudo systemctl restart systemd-journald

# Sysctl tuning
echo "vm.nr_hugepages=64" | sudo tee /etc/sysctl.d/99-hugepages.conf
echo "fs.inotify.max_user_watches=524288" | sudo tee /etc/sysctl.d/40-max-user-watches.conf
echo "net.core.rmem_max=26214400" | sudo tee -a /etc/sysctl.d/99-gaming.conf
echo "net.core.wmem_max=26214400" | sudo tee -a /etc/sysctl.d/99-gaming.conf
sudo sysctl --system

# 🕹️ Mejorar compatibilidad con juegos que usan muchos mappings (ej: Unity, Unreal, Proton)
echo "vm.max_map_count = 2147483642" | sudo tee /etc/sysctl.d/80-gamecompatibility.conf
sudo sysctl --system

# CPU: modo rendimiento
sudo pacman -S --noconfirm amd-ucode cpupower thermald
echo 'governor="performance"' | sudo tee /etc/default/cpupower
sudo systemctl enable cpupower
sudo systemctl enable --now thermald

# Gaming tools
sudo pacman -S --noconfirm gamemode lib32-gamemode mangohud lib32-mangohud wine-staging lib32-wine-staging vulkan-radeon lib32-vulkan-radeon

# 📌 Recomendación de montaje (manual)
echo "⚠️ Recomendación: revisa tu /etc/fstab y ajusta opciones de montaje:"
echo "  Para ext4 ➜ defaults,noatime"
echo "  Para btrfs ➜ rw,relatime,discard=async,compress=zstd:1,ssd"
echo "Puedes verificar tu sistema de archivos con: findmnt /"

echo "✅ Optimizaciones aplicadas. Reboot recomendado."
