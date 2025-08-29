# 🛠️ Script de Posinstalación para Arch Linux + Hyprland

Este script automatiza la configuración inicial de una instalación limpia de Arch Linux con el entorno gráfico Hyprland. Incluye instalación de aplicaciones populares para creatividad, gaming, productividad y configuraciones generales.

> 💡 Especialmente diseñado para PCs con hardware AMD o NVIDIA modernos.

---

## 📦 Programas que instala

- Herramientas base (yay, flatpak, flathub, pamac)
- Creatividad: Krita, Blender, WPS Office
- Streaming y multimedia: OBS, VLC, YouTube Music (AUR), stremio, komikku
- Gaming: Steam, Heroic, Minecraft Launcher, Lutris, Bottles
- Sistema: Htop, Btop, Fastfetch, KDE Connect, Scrcpy
- Comunicación: Discord + Vencord
- Productividad: AFFiNE
- Drivers de Xencelabs
- seguridad: KeePass

---

## ⚙️ Configuraciones extra

- DNS AdGuard
- Teclado inglés con ñ
- Dotfiles de End-4
- Atajos personalizados SUPER+CTRL+[letra]
- Script **secundario** para optimizaciones avanzadas (CPU, GPU, SSD, RAM, gaming)

👉 Consulta el README del script de optimización aquí:  
[📘 optimizaciones.md](./optimizaciones.md)

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

## ⚠️ Advertencia

Este script sobrescribe configuraciones (resolv.conf, hyprland.conf). Haz respaldo si ya tienes sistema configurado.

---

## 🎯 Atajos de teclado personalizados

Todos los atajos usan la combinación `SUPER + CTRL + [Letra]` para abrir rápidamente las aplicaciones más usadas:

| Atajo              | Aplicación               |
|--------------------|---------------------------|
| SUPER + CTRL + K   | Krita                     |
| SUPER + CTRL + B   | Blender                   |
| SUPER + CTRL + W   | WPS Office                |
| SUPER + CTRL + O   | OBS Studio                |
| SUPER + CTRL + S   | Steam                     |
| SUPER + CTRL + H   | Heroic Games Launcher     |
| SUPER + CTRL + M   | Minecraft Launcher        |
| SUPER + CTRL + L   | Lutris                    |
| SUPER + CTRL + T   | Bottles                   |
| SUPER + CTRL + D   | Discord                   |
| SUPER + CTRL + Y   | YouTube Music             |
| SUPER + CTRL + V   | VLC                       |
| SUPER + CTRL + F   | Fastfetch                 |
| SUPER + CTRL + C   | AFFiNE (Flatpak)          |
| SUPER + CTRL + A   | Shiru                     |
| SUPER + CTRL + G   | KeePass                   |
| SUPER + CTRL + R   | Stremio                   |
| SUPER + CTRL + N   | Komikku (Flathub) |
| SUPER + CTRL + P   | Scrcpy                    |

---

## 🧑‍💻 Autor

Hecho con ❤️ por ChatGPT y revisado por Leo J. Legnar
