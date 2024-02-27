import 'package:flutter/material.dart';
import 'package:flutter_splash_animation_example/widgets/splash_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SplashApp splashApp;

  Future<void> _asyncDelay() async {
    await Future.delayed(const Duration(milliseconds: 300));
  }

  Future<void> _animationDelay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  setUp(() {
    splashApp = SplashApp(
      initDependencies: () async {
        await _asyncDelay();
      },
      appWidget: const MaterialApp(
        key: Key('MaterialApp'),
        home: SizedBox(
          width: 200,
          height: 200,
        ),
      ),
    );
  });

  testWidgets('should transitions to MaterialApp after initDependencies completes', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(splashApp);
      expect(find.byType(SplashApp), findsOneWidget);
      expect(find.byType(MaterialApp), findsNothing);

      await _asyncDelay();
      await tester.pump();

      await _animationDelay();
      await tester.pump();

      expect(find.byKey(const Key('MaterialApp')), findsOneWidget);
    });
  });
}
