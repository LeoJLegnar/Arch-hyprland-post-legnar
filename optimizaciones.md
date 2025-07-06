# ⚙️ Script de Optimización para Arch Linux (optimizaciones.sh)

Este script aplica optimizaciones avanzadas para equipos con hardware de gama alta, como Ryzen 7 7800X3D, NVIDIA RTX 5080 y almacenamiento NVMe rápido. Está enfocado en setups ITX con refrigeración limitada y uso multitarea, creativo y gaming.

> ⚠️ **Advertencia:** Este script modifica configuraciones de bajo nivel, incluye servicios y da acceso a herramientas como `RyzenAdj` que pueden afectar estabilidad si se usan incorrectamente. Solo ejecútalo si sabes lo que haces o has leído este archivo completo.

---

## 🧠 ¿Qué hace este script?

### 🧠 Rendimiento & Energía

- Cambia el governor de CPU a `schedutil`
- Activa TLP para ahorro energético pasivo
- Aplica límites térmicos y de consumo con `RyzenAdj` (80 °C máx por defecto)

### 🌡️ Control térmico

- Instala y configura `lm_sensors`
- Controla temperaturas máximas en setups ITX con solo 1 ventilador

### 💾 Almacenamiento

- Activa TRIM periódico para SSDs NVMe
- Si detecta Btrfs, activa compresión `zstd` (requiere sistema con Btrfs)

### 🧠 RAM y Swap

- Activa `ZRAM` para crear swap comprimido en RAM, útil incluso con 96 GB

### 🖥️ NVIDIA RTX 5080

- Instala driver `nvidia-dkms`
- Aplica ajustes especiales para evitar tearing en Wayland (Hyprland)

### 🎮 Gaming

- Instala:
  - `gamemode`: prioriza recursos en juegos
  - `mangohud`: muestra FPS, carga GPU/CPU, etc.
  - `wine`, `winetricks`, `vkd3d`: soporte para juegos de Windows

### 🧼 Sistema y limpieza

- Mejora `pacman.conf` con descargas paralelas, colores, verbose
- Limpia dependencias huérfanas (`yay -Yc`)
- Reduce logs innecesarios

---

## 🧪 ¿Cuándo ejecutar?

Solo después de correr el script principal de postinstalación (`postinstall.sh`).  
Este script **no instala aplicaciones**, solo optimiza el sistema.

---

## 🚀 ¿Cómo ejecutar?

```bash
bash <(curl -s https://raw.githubusercontent.com/LeoJLegnar/Arch-hyprland-post-legnar/main/optimizaciones.sh)
```

---

## 🛑 Recomendaciones antes de ejecutar

1. Haz backup si ya tienes configuraciones personalizadas.
2. No combines este script con otros servicios similares (ej. auto-cpufreq).
3. Verifica manualmente si usas Btrfs antes de aplicar compresión.
4. Si no usas NVIDIA, elimina la sección de drivers para evitar conflictos.

---

## ✨ Autor

Hecho con cariño técnico por ChatGPT y afinado por Leo J. Legnar
