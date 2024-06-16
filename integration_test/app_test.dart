import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bmi_calculator/main.dart' as app;


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('all cards are loaded', (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(412, 915);

    app.main();
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('maleCard')), findsOneWidget);
    expect(find.byKey(const Key('femaleCard')), findsOneWidget);
    expect(find.byKey(const Key('heightCard')), findsOneWidget);
    expect(find.byKey(const Key('weightCard')), findsOneWidget);
    expect(find.byKey(const Key('ageCard')), findsOneWidget);
    expect(find.byKey(const Key('calculateButton')), findsOneWidget);
  });
}