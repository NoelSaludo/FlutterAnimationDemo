// Tests for ButtonBuilder widget factory.
// Framework: flutter_test (WidgetTester). No external mocking libs; using a custom TestNavigatorObserver.
// Focus: Validate labels, types, and navigation side effects (push/pop) for BuildButtonToLottie and BuildBackElivatedButton.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// SUT and related pages
import 'package:flutteranimationdemo/Widget/LottiePage.dart';
import 'package:flutteranimationdemo/shared/PageNavigator.dart' show PageNavigator;
import 'package:flutteranimationdemo/Widget/ButtonBuilder.dart' show ButtonBuilder; // Adjust if actual path differs.

// A minimal NavigatorObserver to capture route events without mockito/mocktail.
class TestNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> pushed = <Route<dynamic>>[];
  final List<Route<dynamic>> popped = <Route<dynamic>>[];
  Route<dynamic>? lastPushed;
  Route<dynamic>? lastPopped;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushed.add(route);
    lastPushed = route;
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    popped.add(route);
    lastPopped = route;
    super.didPop(route, previousRoute);
  }
}

// A harness widget to host the ButtonBuilder-produced button inside a valid Navigator/Material context.
class _Harness extends StatelessWidget {
  final Widget child;
  const _Harness({required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: child),
      ),
    );
  }
}

void main() {
  group('ButtonBuilder', () {
    late ButtonBuilder builder;

    setUp(() {
      builder = ButtonBuilder();
    });

    testWidgets('BuildButtonToLottie returns a TextButton labeled "Lottie Page"', (tester) async {
      final widget = builder.BuildButtonToLottie(
        // context is provided by the harness once pumped
        // we pass a placeholder container; actual build uses enclosing context
        // so we wrap the resulting widget in MaterialApp below
        // ignore: prefer_const_constructors
        const _PlaceholderContext(),
      );

      // Pump with actual context via harness
      await tester.pumpWidget(_Harness(child: Builder(
        builder: (ctx) => builder.BuildButtonToLottie(ctx),
      )));

      expect(find.byType(TextButton), findsOneWidget);
      expect(find.text('Lottie Page'), findsOneWidget);

      // Sanity: onPressed is wired
      final textButton = tester.widget<TextButton>(find.byType(TextButton));
      expect(textButton.onPressed, isNotNull);
    });

    testWidgets('Tapping "Lottie Page" pushes LottiePage route', (tester) async {
      final observer = TestNavigatorObserver();

      await tester.pumpWidget(MaterialApp(
        navigatorObservers: [observer],
        home: Scaffold(
          body: Builder(
            builder: (ctx) => builder.BuildButtonToLottie(ctx),
          ),
        ),
      ));

      expect(find.byType(LottiePage), findsNothing);

      await tester.tap(find.text('Lottie Page'));
      await tester.pumpAndSettle();

      // Verify a route was pushed
      expect(observer.pushed.isNotEmpty, isTrue, reason: 'Expected a route push after tapping the button');

      // Verify that LottiePage is now present in the widget tree
      expect(find.byType(LottiePage), findsOneWidget);
    });

    testWidgets('BuildBackElivatedButton returns an ElevatedButton labeled "Back"', (tester) async {
      await tester.pumpWidget(_Harness(child: Builder(
        builder: (ctx) => builder.BuildBackElivatedButton(ctx),
      )));

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);

      final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevatedButton.onPressed, isNotNull);
    });

    testWidgets('Tapping "Back" pops the current route', (tester) async {
      final observer = TestNavigatorObserver();

      // Start with two routes so that a pop is observable
      await tester.pumpWidget(MaterialApp(
        navigatorObservers: [observer],
        home: Scaffold(
          body: const Center(child: Text('Home')),
        ),
        routes: {
          '/second': (_) => Scaffold(
                body: Builder(builder: (ctx) => builder.BuildBackElivatedButton(ctx)),
              ),
        },
      ));

      // Push the second route
      final navKey = GlobalKey<NavigatorState>();
      await tester.pumpWidget(MaterialApp(
        navigatorKey: navKey,
        navigatorObservers: [observer],
        home: Scaffold(
          body: Builder(
            builder: (ctx) => Column(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(ctx).pushNamed('/second'),
                  child: const Text('Go'),
                ),
              ],
            ),
          ),
        ),
        routes: {
          '/second': (_) => Scaffold(
                body: Builder(builder: (ctx) => builder.BuildBackElivatedButton(ctx)),
              ),
        },
      ));

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();
      expect(find.text('Back'), findsOneWidget, reason: 'Should be on second route with Back button');

      // Tap Back -> expect a pop
      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();

      expect(observer.popped.isNotEmpty, isTrue, reason: 'Expected a route pop after tapping Back');
      expect(find.text('Go'), findsOneWidget, reason: 'Should be back on the initial route');
    });

    testWidgets('Buttons are accessible with clear labels', (tester) async {
      // Lottie button
      await tester.pumpWidget(_Harness(child: Builder(
        builder: (ctx) => builder.BuildButtonToLottie(ctx),
      )));
      final lottieSemantics = tester.getSemantics(find.text('Lottie Page'));
      expect(lottieSemantics.hasFlag(SemanticsFlag.isButton), isTrue);

      // Back button
      await tester.pumpWidget(_Harness(child: Builder(
        builder: (ctx) => builder.BuildBackElivatedButton(ctx),
      )));
      final backSemantics = tester.getSemantics(find.text('Back'));
      expect(backSemantics.hasFlag(SemanticsFlag.isButton), isTrue);
    });
  });
}

// Helper widget to satisfy type where a BuildContext is needed before pump.
// It will not actually be used; real contexts come from Builder during pump.
class _PlaceholderContext extends StatelessWidget {
  const _PlaceholderContext({super.key});
  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}