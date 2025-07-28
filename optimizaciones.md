# ⚙️ Script de Optimización para Arch Linux (optimizaciones.sh)

Este script aplica optimizaciones avanzadas para equipos con hardware de gama alta como Ryzen 9 7950X, NVIDIA RTX 5080 y almacenamiento NVMe PCIe 4.0. Está diseñado para estaciones de trabajo potentes con refrigeración líquida y uso intensivo creativo/gaming.

> ⚠️ **Advertencia:** Este script modifica configuraciones de bajo nivel, incluyendo servicios de energía y límites térmicos. Solo ejecútalo si sabes lo que haces o has leído este archivo completo.

---

## 🧠 ¿Qué hace este script?

### 🧠 Rendimiento & Energía

- Cambia el governor de CPU a `schedutil`
- Activa `auto-cpufreq` para ajuste dinámico de frecuencias
- Configura `RyzenAdj` para controlar temperatura y consumo (hasta 90 °C con AIO 360 mm)

### 🌡️ Control térmico

- Instala y configura `lm_sensors` para lectura de temperaturas
- Detecta sensores automáticamente

### 💾 Almacenamiento

- Activa TRIM periódico para SSDs NVMe
- Si detecta Btrfs, aplica compresión `zstd`

### 🧠 RAM y Swap

- Activa `ZRAM` con compresión `zstd`
- Usa 32 GB de RAM comprimida como swap rápida

### 🖥️ NVIDIA RTX 5080

- Instala driver `nvidia-dkms`
- Ajustes para evitar tearing en Wayland (Hyprland)

### 🎮 Gaming

- Instala:
  - `gamemode`: prioriza recursos en juegos
  - `mangohud`: monitor en pantalla con FPS, temperaturas, carga
  - `wine`, `winetricks`, `vkd3d`: compatibilidad con juegos de Windows

### 🧼 Sistema y limpieza

- Optimiza `pacman.conf`: descargas paralelas, colores, verbose, candy
- Limpia paquetes huérfanos (`yay -Yc`)

---

## 🧪 ¿Cuándo ejecutar?

Solo después de correr el script principal de post-instalación (`postinstall.sh`).  
Este script **no instala programas principales**, solo optimiza el sistema.

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
