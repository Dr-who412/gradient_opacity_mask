import 'package:flutter/material.dart';

// 1. IMPORT YOUR PACKAGE
// Make sure your package name in example/pubspec.yaml matches.
// Let's assume the package name is 'gradient_opacity_mask'.
import 'package:gradient_opacity_mask/gradient_opacity_mask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1a1a1a),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2c2c2c),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GradientOpacityMask Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- SECTION 1: VERTICAL CONSTRUCTORS ---
              const DemoHeader("1. Vertical Convenience Constructors"),
              const SizedBox(height: 16),
              const DemoSubHeader("Simple Two-Point Fade (Top to Bottom)"),
              GradientOpacityMask.vertical(
                child: _buildDemoContent(),
              ),
              const SizedBox(height: 24),
              const DemoSubHeader("Three-Point 'Dip' Fade"),
              GradientOpacityMask.threePointVertical(
                startOpacity: 1.0,
                centerOpacity: 0.0,
                endOpacity: 1.0,
                child: _buildDemoContent(),
              ),
              const DemoDivider(),

              // --- SECTION 2: HORIZONTAL CONSTRUCTORS ---
              const DemoHeader("2. Horizontal Convenience Constructors"),
              const SizedBox(height: 16),
              const DemoSubHeader("Simple Two-Point Fade (Left to Right)"),
              GradientOpacityMask.horizontal(
                child: _buildDemoContent(),
              ),
              const SizedBox(height: 24),
              const DemoSubHeader("Three-Point 'Window' Fade"),
              GradientOpacityMask.threePointHorizontal(
                startOpacity: 0.0,
                centerOpacity: 1.0,
                endOpacity: 0.0,
                child: _buildDemoContent(),
              ),
              const DemoDivider(),

              // --- SECTION 3: ADVANCED GRADIENTS ---
              const DemoHeader("3. Advanced & Non-Linear Gradients"),
              const SizedBox(height: 16),
              const DemoSubHeader("Radial Gradient 'Spotlight'"),
              GradientOpacityMask(
                opacities: const [1.0, 1.0, 0.0],
                stops: const [0.0, 0.4, 1.0],
                gradientType: GradientType.radial,
                child: _buildDemoContent(),
              ),
              const SizedBox(height: 24),
              const DemoSubHeader("Sweep Gradient 'Radar'"),
              GradientOpacityMask(
                opacities: const [0.0, 1.0, 1.0, 0.0],
                stops: const [0.0, 0.25, 0.75, 1.0],
                gradientType: GradientType.sweep,
                child: _buildDemoContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// A reusable widget to apply the mask to.
  Widget _buildDemoContent() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        'https://images.unsplash.com/photo-1617094541818-5a242835925a?w=400',
        width: 300,
        height: 200,
        fit: BoxFit.cover,
        // A fallback in case the image fails to load
        errorBuilder: (context, error, stackTrace) => Container(
          width: 300,
          height: 200,
          color: Colors.blueGrey[800],
          child: const Center(
            child: Icon(Icons.error_outline, color: Colors.white54, size: 40),
          ),
        ),
      ),
    );
  }
}

// --- Helper Widgets for Demo UI ---

class DemoHeader extends StatelessWidget {
  final String text;
  const DemoHeader(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineSmall);
  }
}

class DemoSubHeader extends StatelessWidget {
  final String text;
  const DemoSubHeader(this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class DemoDivider extends StatelessWidget {
  const DemoDivider({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Divider(color: Colors.white24),
    );
  }
}