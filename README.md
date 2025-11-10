# Gradient Opacity Mask

[![pub version](https://img.shields.io/pub/v/gradient_opacity_mask.svg)](https://pub.dev/packages/gradient_opacity_mask)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A versatile Flutter widget that applies a customizable gradient mask to any child widget, allowing for beautiful fade effects and creative blends.

| Vertical & Horizontal Fades | Radial "Spotlight" | Advanced Custom Fades |
| :---: | :---: | :---: |
| ![Vertical and Horizontal Examples](https://github.com/Dr-who412/gradient_opacity_mask/raw/image/assets/Screenshot_20251110_101446.png) | ![Radial Gradient Example](https://github.com/Dr-who412/gradient_opacity_mask/raw/image/assets/Screenshot_20251110_101500.png) | ![Advanced Fade Examples](https://github.com/Dr-who412/gradient_opacity_mask/raw/image/assets/Screenshot_20251110_101509.png) |

> **Note:** Create a GIF showcasing your widget and replace the link above. This is crucial for a UI package! You can use tools like [ScreenToGif](https://www.screentogif.com/) or Kap.

## Features

- ✅ **Apply a gradient opacity mask** to any widget.
- 🎨 Supports **Linear**, **Radial**, and **Sweep** gradients.
- 🚀 **Simple convenience constructors** for common vertical and horizontal fades.
- ⚙️ **Fully customizable** opacities, colors, and stops.
- 🖌️ Supports custom `BlendMode` for advanced creative effects beyond just opacity.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  gradient_opacity_mask: ^1.0.0 # Replace with the latest version
```

Then, run `flutter pub get` in your terminal.

## Getting Started

The easiest way to use the widget is with its convenience constructors. For example, to make a widget fade out towards the bottom:

```dart
import 'package:gradient_opacity_mask/gradient_opacity_mask.dart';

// ...

GradientOpacityMask.vertical(
  child: YourScrollableList(), // Perfect for lists that scroll off-screen
)
```

## Examples

### 1. Vertical & Horizontal Fades

Use the simple constructors for common UI effects.

#### Vertical Fade (Top to Bottom)
```dart
GradientOpacityMask.vertical(
  child: Image.network('...'),
)
```

#### Horizontal Fade (Left to Right)
```dart
GradientOpacityMask.horizontal(
  child: Text("Fading from left to right"),
)
```

### 2. Three-Point Fades

These constructors are great for making the center of a widget stand out or fade away.

#### Vertical "Dip" (Visible Top/Bottom, Faded Center)
```dart
GradientOpacityMask.threePointVertical(
  startOpacity: 1.0,
  centerOpacity: 0.0,
  endOpacity: 1.0,
  child: Image.network('...'),
)
```

#### Horizontal "Window" (Visible Center, Faded Edges)
```dart
GradientOpacityMask.threePointHorizontal(
  startOpacity: 0.0,
  centerOpacity: 1.0,
  endOpacity: 0.0,
  child: Text("I'm in the spotlight!"),
)
```

### 3. Advanced Custom Gradients

For complete control, use the default constructor.

#### Custom Linear Gradient
This creates a sharp fade-in/fade-out effect at the edges.
```dart
GradientOpacityMask(
  opacities: const [0.0, 1.0, 1.0, 0.0],
  stops: const [0.0, 0.2, 0.8, 1.0],
  linearAxis: Axis.horizontal,
  child: Image.network('...'),
)
```

#### Radial Gradient (Spotlight Effect)
This makes the widget fully visible in the center and fade out towards the edges.
```dart
GradientOpacityMask(
  opacities: const [1.0, 1.0, 0.0],
  stops: const [0.0, 0.5, 1.0],
  gradientType: GradientType.radial,
  child: YourWidget(),
)
```

#### Sweep Gradient (Radar Effect)
```dart
GradientOpacityMask(
  opacities: const [0.0, 1.0, 0.0],
  stops: const [0.25, 0.5, 0.75],
  gradientType: GradientType.sweep,
  child: YourWidget(),
)
```

## Main Properties

| Parameter      | Type           | Description                                                              |
|----------------|----------------|--------------------------------------------------------------------------|
| `child`        | `Widget`       | **Required.** The widget to apply the mask to.                           |
| `opacities`    | `List<double>` | **Required.** List of opacity values (0.0 to 1.0).                       |
| `stops`        | `List<double>` | **Required.** List of positions (0.0 to 1.0) for each opacity.           |
| `gradientType` | `GradientType` | The type of gradient: `linear`, `radial`, or `sweep`. Defaults to `linear`. |
| `linearAxis`   | `Axis`         | The axis for linear gradients: `vertical` or `horizontal`. Defaults to `vertical`. |
| `blendMode`    | `BlendMode`    | The blend mode for the shader. Defaults to `BlendMode.dstIn` for opacity. |


## Contributing

Contributions are welcome! If you find a bug or have a feature request, please open an issue. If you want to contribute code, please open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.