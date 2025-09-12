import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Note: PageNavigator import resolved at runtime by the script placeholder below.
// ignore_for_file: unused_import
import '../lib/page_navigator.dart';

class RecordingNavigatorObserver extends NavigatorObserver {
  final List<Route<dynamic>> pushed = <Route<dynamic>>[];
  final List<Route<dynamic>> popped = <Route<dynamic>>[];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushed.add(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    popped.add(route);
    super.didPop(route, previousRoute);
  }
}

class DestinationPage extends StatelessWidget {
  final String label;
  final PageNavigator navigator;

  const DestinationPage({
    Key? key,
    required this.label,
    required this.navigator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Destination $label')),
      body: Center(
        child: ElevatedButton(
          key: Key('pop-$label'),
          onPressed: () => navigator.goBack(context),
          child: const Text('Pop'),
        ),
      ),
    );
  }
}

class HomeWithControls extends StatelessWidget {
  final PageNavigator navigator;

  const HomeWithControls({Key? key, required this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              key: const Key('push'),
              onPressed: () => navigator.goTo(
                context,
                DestinationPage(label: 'A', navigator: navigator),
              ),
              child: const Text('Push'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              key: const Key('pop'),
              onPressed: () => navigator.goBack(context),
              child: const Text('Pop (from Home)'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('PageNavigator', () {
    late PageNavigator navigator;
    late RecordingNavigatorObserver observer;

    setUp(() {
      navigator = PageNavigator();
      observer = RecordingNavigatorObserver();
    });

    Widget _app(Widget home) => MaterialApp(
          home: home,
          navigatorObservers: [observer],
        );

    testWidgets('goTo pushes a MaterialPageRoute and shows destination',
        (tester) async {
      await tester.pumpWidget(_app(HomeWithControls(navigator: navigator)));

      expect(find.text('Home'), findsOneWidget);
      expect(find.textContaining('Destination'), findsNothing);

      await tester.tap(find.byKey(const Key('push')));
      await tester.pumpAndSettle();

      // Destination is visible
      expect(find.text('Destination A'), findsOneWidget);
      // A push happened and it used MaterialPageRoute
      expect(observer.pushed.length, 1);
      expect(observer.pushed.single, isA<MaterialPageRoute>());
    });

    testWidgets('goBack pops the top route and returns to previous page',
        (tester) async {
      await tester.pumpWidget(_app(HomeWithControls(navigator: navigator)));

      // Push to Destination
      await tester.tap(find.byKey(const Key('push')));
      await tester.pumpAndSettle();
      expect(find.text('Destination A'), findsOneWidget);

      // Now pop via button on the destination page (uses PageNavigator.goBack)
      await tester.tap(find.byKey(const Key('pop-A')));
      await tester.pumpAndSettle();

      // Back to Home, and a pop was recorded
      expect(find.text('Home'), findsOneWidget);
      expect(observer.popped.length, 1);
    });

    testWidgets('Multiple pushes then single pop returns to previous route',
        (tester) async {
      await tester.pumpWidget(_app(HomeWithControls(navigator: navigator)));

      // Push first destination
      await tester.tap(find.byKey(const Key('push')));
      await tester.pumpAndSettle();
      expect(find.text('Destination A'), findsOneWidget);

      // From A, push another destination B using goTo directly
      await tester.runAsync(() async {
        navigator.goTo(
          tester.element(find.byType(Scaffold).first),
          DestinationPage(label: 'B', navigator: navigator),
        );
      });
      await tester.pumpAndSettle();

      expect(find.text('Destination B'), findsOneWidget);

      // Pop once -> back to Destination A
      await tester.tap(find.byKey(const Key('pop-B')));
      await tester.pumpAndSettle();

      expect(find.text('Destination A'), findsOneWidget);
    });

    testWidgets('Pop from Home (initial route) leaves app on Home',
        (tester) async {
      await tester.pumpWidget(_app(HomeWithControls(navigator: navigator)));

      // Attempt to pop at initial route; app should remain on Home.
      await tester.tap(find.byKey(const Key('pop')));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      // No pop should have been recorded
      expect(observer.popped, isEmpty);
    });
  });
}