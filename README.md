# 🛠️ Script de Posinstalación para Arch Linux + Hyprland

Este script automatiza la configuración inicial de una instalación limpia de Arch Linux con el entorno gráfico Hyprland. Incluye instalación de aplicaciones populares para creatividad, desarrollo, gaming, productividad y configuraciones generales.

> 💡 Especialmente diseñado para PCs con hardware AMD moderno, como Ryzen 7 y GPU Radeon RX.

---

## 📦 Programas que instala

- Herramientas base (yay, flatpak, pamac)
- Creatividad: Krita, Blender, WPS Office
- Desarrollo: VS Code
- Streaming y multimedia: OBS, VLC, Spotify + Spicetify, AFFiNE, Endel
- Gaming: Steam, Heroic, Minecraft Launcher, Lutris, Bottles
- Sistema: Htop, Btop, Fastfetch, KDE Connect, CoolerControl
- Comunicación: Discord + Vencord
- Terminal retro: Cool-retro-term
- Drivers de Xencelabs

---

## ⚙️ Configuraciones extra

- DNS AdGuard
- Teclado inglés con ñ
- Dotfiles de End-4
- Atajos personalizados SUPER+CTRL+[letra]
- (Opcional) Script separado para optimizaciones de CPU, RAM, SSD y gaming

---

## 🧪 ¿Cómo usar?

### ✅ Ejecutar directamente desde GitHub:

```bash
bash <(curl -s https://raw.githubusercontent.com/LeoJLegnar/Arch-hyprland-post-legnar/main/postinstall.sh)
```

### 🛠️ O clonar:

```bash
git clone https://github.com/LeoJLegnar/Arch-hyprland-post-legnar.git
cd Arch-hyprland-post-legnar
chmod +x postinstall.sh
./postinstall.sh
```

---

## ⚙️ Script opcional de optimización

Puedes ejecutar un script separado que realiza ajustes para aprovechar mejor tu hardware:

- Mejora el uso de los 64 GB de RAM con ZRAM
- Reduce escrituras al SSD NVMe
- Activa TRIM y reduce logs
- Optimiza la CPU y habilita modo "performance"
- Incluye Gamemode, Wine y MangoHUD para gaming

### Ejecutar:

```bash
bash <(curl -s https://raw.githubusercontent.com/LeoJLegnar/Arch-hyprland-post-legnar/main/optimizaciones.sh)
```

---

## ⚠️ Advertencia

Este script sobrescribe configuraciones (resolv.conf, hyprland.conf). Haz respaldo si ya tienes sistema configurado.

---

## 🎯 Atajos de teclado personalizados

Los siguientes atajos fueron añadidos automáticamente al archivo `hyprland.conf`. Todos usan la combinación `SUPER + CTRL + [Letra]` para abrir rápidamente las aplicaciones más usadas:

| Atajo              | Aplicación               |
|--------------------|---------------------------|
| SUPER + CTRL + K   | Krita                     |
| SUPER + CTRL + B   | Blender                   |
| SUPER + CTRL + W   | WPS Office                |
| SUPER + CTRL + V   | Visual Studio Code        |
| SUPER + CTRL + O   | OBS Studio                |
| SUPER + CTRL + S   | Steam                     |
| SUPER + CTRL + H   | Heroic Games Launcher     |
| SUPER + CTRL + M   | Minecraft Launcher        |
| SUPER + CTRL + L   | Lutris                    |
| SUPER + CTRL + T   | Bottles                   |
| SUPER + CTRL + D   | Discord                   |
| SUPER + CTRL + P   | Spotify                   |
| SUPER + CTRL + C   | VLC                       |
| SUPER + CTRL + F   | Fastfetch                 |
| SUPER + CTRL + A   | AFFiNE (Flatpak)          |
| SUPER + CTRL + R   | Cool retro term           |
| SUPER + CTRL + E   | Endel (Flatpak)           |

---

## 🧑‍💻 Autor

Hecho con ❤️ por Chat GPT y revisado por Leo J. Legnar
