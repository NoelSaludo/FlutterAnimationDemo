import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Import the app package root and MyHomePage symbol.
// We try both common locations: lib/main.dart exporting MyHomePage or a dedicated file.
// Adjust the active import below if needed based on actual file location.
// Prefer keeping both with conditional comments for easy toggling during review.

// Option A: if MyHomePage is defined in lib/main.dart (common in demos)
// import 'package:flutteranimationdemo/main.dart';

// Option B: if MyHomePage is in lib/home_widget.dart or similar
// import 'package:flutteranimationdemo/home_widget.dart';

// Fallback: relative import (useful if package name differs in pubspec)
import '../lib/main.dart' show MyHomePage;

void main() {
  group('MyHomePage widget', () {
    testWidgets('renders a Scaffold with AppBar using provided title', (WidgetTester tester) async {
      const title = 'Home Title';
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: title),
        ),
      );

      // Verify Scaffold exists
      expect(find.byType(Scaffold), findsOneWidget);

      // Verify AppBar exists and shows the given title text
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('uses a Center containing a Column with centered alignment', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: 'Any'),
        ),
      );

      // Center exists
      final centerFinder = find.byType(Center);
      expect(centerFinder, findsOneWidget);

      // Column exists and has MainAxisAlignment.center
      final columnFinder = find.byType(Column);
      expect(columnFinder, findsOneWidget);

      final Column column = tester.widget<Column>(columnFinder);
      expect(column.mainAxisAlignment, equals(MainAxisAlignment.center));
    });

    testWidgets('builds exactly one primary child in the Column for navigation controls', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: 'Any'),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      // Defensive: ensure there is at least one child (from ButtonBuilder.BuildButtonToLottie)
      expect(column.children.length, greaterThanOrEqualTo(1));

      // We assert exactly one for current implementation where only the button is included.
      // If future elements are added intentionally, update this assertion accordingly.
      expect(column.children.length, equals(1));
    });

    testWidgets('AppBar backgroundColor respects Theme colorScheme.inversePrimary', (WidgetTester tester) async {
      // Create a distinctive color to assert against
      const inversePrimary = Color(0xFF112233);
      final theme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
          inversePrimary: inversePrimary,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: const MyHomePage(title: 'Theme Check'),
        ),
      );

      final AppBar appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, equals(inversePrimary));
    });

    testWidgets('gracefully handles long titles without overflow (text is laid out)', (WidgetTester tester) async {
      const longTitle = 'This is a very long title that should still be visible and laid out without throwing overflow errors in the AppBar title widget.';
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(title: longTitle),
        ),
      );

      // The presence of the text implies layout succeeded; overflow would throw during pump.
      expect(find.text(longTitle), findsOneWidget);
    });

    testWidgets('tree remains stable on theme change (no exceptions thrown on rebuild)', (WidgetTester tester) async {
      final light = ThemeData.light();
      final dark = ThemeData.dark();

      await tester.pumpWidget(
        MaterialApp(
          theme: light,
          home: const MyHomePage(title: 'Stability'),
        ),
      );
      expect(find.byType(MyHomePage), findsOneWidget);

      // Rebuild with a different theme to ensure no setState/assertion errors
      await tester.pumpWidget(
        MaterialApp(
          theme: dark,
          home: const MyHomePage(title: 'Stability'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyHomePage), findsOneWidget);
    });
  });
}