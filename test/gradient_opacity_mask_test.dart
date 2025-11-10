// Import the flutter_test package.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_opacity_mask/gradient_opacity_mask.dart';


void main() {
  // A simple child widget to use in all tests.
  const Widget testChild = SizedBox(key: Key('child_widget'), width: 100, height: 100);

  // Use group() to organize tests related to a specific feature.
  group('GradientOpacityMask Constructor Assertions', () {
    testWidgets('throws AssertionError if opacities and stops lists have different lengths', (WidgetTester tester) async {
      // Expecting an assertion error, so we wrap the widget creation in a closure.
      expect(
            () => GradientOpacityMask(
          opacities: const [1.0], // Length 1
          stops: const [0.0, 1.0], // Length 2
          child: testChild,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    testWidgets('throws AssertionError if opacities list is empty', (WidgetTester tester) async {
      expect(
            () => GradientOpacityMask(
          opacities: const [],
          stops: const [],
          child: testChild,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    testWidgets('throws AssertionError if stops list is empty', (WidgetTester tester) async {
      expect(
            () => GradientOpacityMask(
          opacities: const [1.0],
          stops: const [],
          child: testChild,
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });

  group('GradientOpacityMask Rendering', () {
    testWidgets('renders child widget successfully', (WidgetTester tester) async {
      // Build our widget and trigger a frame.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientOpacityMask(
              opacities: const [1.0, 0.0],
              stops: const [0.0, 1.0],
              child: testChild,
            ),
          ),
        ),
      );

      // Verify that the child widget is found.
      expect(find.byKey(const Key('child_widget')), findsOneWidget);
    });

    testWidgets('builds a ShaderMask widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientOpacityMask(
              opacities: const [1.0, 0.0],
              stops: const [0.0, 1.0],
              child: testChild,
            ),
          ),
        ),
      );

      // Verify that the underlying implementation uses a ShaderMask.
      expect(find.byType(ShaderMask), findsOneWidget);
    });
  });

  group('Convenience Constructors', () {
    testWidgets('GradientOpacityMask.vertical builds without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientOpacityMask.vertical(child: testChild),
          ),
        ),
      );
      expect(find.byType(GradientOpacityMask), findsOneWidget);
      expect(find.byKey(const Key('child_widget')), findsOneWidget);
    });

    testWidgets('GradientOpacityMask.horizontal builds without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientOpacityMask.horizontal(child: testChild),
          ),
        ),
      );
      expect(find.byType(GradientOpacityMask), findsOneWidget);
      expect(find.byKey(const Key('child_widget')), findsOneWidget);
    });

    testWidgets('GradientOpacityMask.threePointVertical builds without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientOpacityMask.threePointVertical(child: testChild),
          ),
        ),
      );
      expect(find.byType(GradientOpacityMask), findsOneWidget);
      expect(find.byKey(const Key('child_widget')), findsOneWidget);
    });

    testWidgets('GradientOpacityMask.threePointHorizontal builds without errors', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientOpacityMask.threePointHorizontal(child: testChild),
          ),
        ),
      );
      expect(find.byType(GradientOpacityMask), findsOneWidget);
      expect(find.byKey(const Key('child_widget')), findsOneWidget);
    });
  });
}