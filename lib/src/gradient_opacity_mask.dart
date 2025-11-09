import 'package:flutter/material.dart';

/// Defines the type of gradient to be used for the mask.
enum GradientType { linear, radial, sweep }

/// A widget that applies a customizable gradient mask to its child.
///
/// This widget uses a [ShaderMask] to control the opacity or appearance of its
/// child based on a provided gradient. It supports linear, radial, and sweep
/// gradients.
class GradientMask extends StatelessWidget {
  /// Creates a widget that applies a gradient mask to a child.
  ///
  /// The [opacities] and [stops] lists must not be empty and must have the
  /// same length.
  GradientMask({
    super.key,
    required this.child,
    required this.opacities,
    required this.stops,
    this.gradientType = GradientType.linear,
    this.blendMode = BlendMode.dstIn,
    this.linearAxis = Axis.vertical,
  })  : assert(opacities.isNotEmpty, 'Opacities list cannot be empty.'),
        assert(stops.isNotEmpty, 'Stops list cannot be empty.'),
        assert(
        opacities.length == stops.length,
        'Opacities and Stops lists must have the same length.',
        );

  /// A convenience constructor for a simple vertical linear gradient.
  /// Fades from [startOpacity] to [endOpacity].
  GradientMask.vertical({
    super.key,
    required this.child,
    double startOpacity = 1.0,
    double endOpacity = 0.0,
  })  : opacities = [startOpacity, endOpacity],
        stops = [0.0, 1.0],
        gradientType = GradientType.linear,
        blendMode = BlendMode.dstIn,
        linearAxis = Axis.vertical;

  /// A convenience constructor for a 3-point vertical linear gradient.
  GradientMask.threePointVertical({
    super.key,
    required this.child,
    double startOpacity = 1.0,
    double centerOpacity = 0.5,
    double endOpacity = 0.0,
  })  : opacities = [startOpacity, centerOpacity, endOpacity],
        stops = [0.0, 0.5, 1.0],
        gradientType = GradientType.linear,
        blendMode = BlendMode.dstIn,
        linearAxis = Axis.vertical;

  /// A convenience constructor for a simple horizontal linear gradient.
  /// Fades from [startOpacity] to [endOpacity].
  GradientMask.horizontal({
    super.key,
    required this.child,
    double startOpacity = 1.0,
    double endOpacity = 0.0,
  })  : opacities = [startOpacity, endOpacity],
        stops = [0.0, 1.0],
        gradientType = GradientType.linear,
        blendMode = BlendMode.dstIn,
        linearAxis = Axis.horizontal;

  /// A convenience constructor for a 3-point horizontal linear gradient.
  GradientMask.threePointHorizontal({
    super.key,
    required this.child,
    double startOpacity = 1.0,
    double centerOpacity = 0.5,
    double endOpacity = 0.0,
  })  : opacities = [startOpacity, centerOpacity, endOpacity],
        stops = [0.0, 0.5, 1.0],
        gradientType = GradientType.linear,
        blendMode = BlendMode.dstIn,
        linearAxis = Axis.horizontal;

  /// The widget below this widget in the tree.
  final Widget child;

  /// A list of opacity values for the gradient mask.
  final List<double> opacities;

  /// A list of positions from 0.0 to 1.0 for each opacity.
  final List<double> stops;

  /// The type of gradient to apply.
  final GradientType gradientType;

  /// The blend mode to use for applying the shader.
  /// Defaults to [BlendMode.dstIn] for opacity masking.
  final BlendMode blendMode;

  /// The axis for the [GradientType.linear] gradient.
  final Axis linearAxis;

  @override
  Widget build(BuildContext context) {
    final maskColors = opacities
        .map((opacity) => Colors.black.withOpacity(opacity))
        .toList();

    return ShaderMask(
      blendMode: blendMode,
      shaderCallback: (bounds) {
        switch (gradientType) {
          case GradientType.radial:
            return RadialGradient(
              colors: maskColors,
              stops: stops,
            ).createShader(bounds);
          case GradientType.sweep:
            return SweepGradient(
              colors: maskColors,
              stops: stops,
            ).createShader(bounds);
          case GradientType.linear:
          default:
            final begin = linearAxis == Axis.vertical
                ? Alignment.topCenter
                : Alignment.centerLeft;
            final end = linearAxis == Axis.vertical
                ? Alignment.bottomCenter
                : Alignment.centerRight;
            return LinearGradient(
              begin: begin,
              end: end,
              colors: maskColors,
              stops: stops,
            ).createShader(bounds);
        }
      },
      child: child,
    );
  }
}