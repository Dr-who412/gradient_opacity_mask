# gradient_opacity_mask

A versatile Flutter widget that applies a customizable gradient mask (linear, radial, or sweep) to any child widget, allowing for beautiful fade effects.

![Example of Gradient Opacity Mask](https://i.imgur.com/8Jc8YfE.gif)

## Features

*   Apply a gradient opacity mask to any Flutter widget.
*   Supports three types of gradients: `Linear`, `Radial`, and `Sweep`.
*   Highly customizable gradients with full control over `opacities` and `stops`.
*   Convenience constructors for common vertical fade effects.
*   Control the `BlendMode` for different masking effects.
*   Specify the axis for linear gradients (`horizontal` or `vertical`).

## Getting started

To use this package, add `gradient_opacity_mask` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  gradient_opacity_mask: ^1.0.0 # Use the latest version
```

Then, run `flutter pub get` to install the package.

## Usage

Import the package in your Dart file:

```dart
import 'package:gradient_opacity_mask/gradient_opacity_mask.dart';
```

You can then use the `GradientMask` widget to apply a gradient mask to any child widget. Here's a basic example of a vertical fade:

```dart
GradientMask(
  opacities: [1.0, 0.0],
  stops: [0.0, 1.0],
  child: Image.network(
    'https://images.unsplash.com/photo-1595769524037-8c4308a4a47d',
    fit: BoxFit.cover,
  ),
)
```

For a simpler vertical fade, you can use the `GradientMask.vertical` convenience constructor:

```dart
GradientMask.vertical(
  child: Text(
    'Fading Text',
    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
  ),
)
```

Here's a more complex example using a radial gradient:

```dart
GradientMask(
  opacities: [1.0, 1.0, 0.0, 0.0],
  stops: [0.0, 0.4, 0.6, 1.0],
  gradientType: GradientType.radial,
  child: YourAwesomeWidget(),
)
```

## Additional information

For more examples, check out the `/example` folder in the repository. If you encounter any issues or have suggestions for improvement, please file an issue on the GitHub repository. Contributions are welcome!
