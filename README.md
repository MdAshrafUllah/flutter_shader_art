# 🌌 Mesmerizing Flutter Shaders

A high-performance **Flutter** application showcasing the power of **GLSL (OpenGL Shading Language)**. This project demonstrates how to offload complex visual calculations to the **GPU** to create mathematical fractal art and neon glow effects in real-time.

## ✨ Features

* **Custom Fragment Shaders:** Utilizes `.frag` source code running directly on the Graphics Processing Unit.
* **Real-time Interactivity:** Dynamic parameters (density and glow) controllable via Flutter sliders.
* **High Performance:** Achieves 60+ FPS by performing pixel-by-pixel calculations on the GPU rather than the CPU.
* **Procedural Art:** Generates complex patterns using Sine, Cosine, and Exponential mathematical functions.

## 🚀 Technical Stack

* **Framework:** Flutter
* **Language:** Dart & GLSL (OpenGL Shading Language)
* **Rendering Engine:** Skia / Impeller (Compatible with Flutter 3.7+)
* **Core Concepts:** Signed Distance Fields (SDF), Fractal Brownian Motion, and Trigonometric Color Mapping.

## 🛠️ Project Setup

1. Add the `flutter_shaders` package to your `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_shaders: ^latest_version

```


2. Register the shader asset:
```yaml
flutter:
  shaders:
    - assets/shaders/shader.frag

```


3. Run the application:
```bash
flutter run

```



## 📖 How It Works

The magic happens inside the `shader.frag` file. Instead of drawing shapes manually, the GPU asks every single pixel: *"How far are you from the center?"* and applies a color based on that distance and time.

* **`uTime`**: Animates the patterns over time.
* **`fract()`**: Subdivides the coordinate space to create a kaleidoscope repetition effect.
* **`uValue1 & uValue2`**: Uniform variables passed from the Flutter UI to the GPU to modify the visual complexity.

---

<div align="center">
  <h3>🎬 Project Demo</h3>
  <video src="https://github.com/MdAshrafUllah/flutter_shader_art/raw/refs/heads/main/flutter_shader_art.mp4" width="100%" max-width="600px" controls autoplay loop muted>
    Your browser does not support the video tag.
  </video>
</div>
