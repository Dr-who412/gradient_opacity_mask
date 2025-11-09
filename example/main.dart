import 'package:flutter/material.dart';
import 'package:gradient_opacity_mask/gradient_opacity_mask.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Opacity Mask Example',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'Gradient Opacity Mask Examples',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),

        // Vertical Fade Example
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Vertical Fade', style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 300,
          child: GradientMask.vertical(
            child: Image.network(
              'https://images.unsplash.com/photo-1617021382453-55949a4a7538?w=800',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Horizontal Fade Example
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Horizontal Fade', style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 300,
          child: GradientMask.horizontal(
            child: Image.network(
              'https://images.unsplash.com/photo-1595769524037-8c4308a4a47d?w=800',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Radial Fade Example
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Radial Fade', style: TextStyle(fontSize: 18)),
        ),
        SizedBox(
          height: 300,
          child: GradientMask(
            opacities: const [1.0, 1.0, 0.0, 0.0],
            stops: const [0.0, 0.4, 0.6, 1.0],
            gradientType: GradientType.radial,
            child: Image.network(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=800',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
