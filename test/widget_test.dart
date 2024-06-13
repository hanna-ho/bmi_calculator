import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('all cards are loaded', (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = Size(412, 915);

    await tester.pumpWidget(BMICalculator());

    expect(find.byKey(Key('maleCard')), findsOneWidget);
    expect(find.byKey(Key('femaleCard')), findsOneWidget);
    expect(find.byKey(Key('heightCard')), findsOneWidget);
    expect(find.byKey(Key('weightCard')), findsOneWidget);
    expect(find.byKey(Key('ageCard')), findsOneWidget);
    expect(find.byKey(Key('calculateButton')), findsOneWidget);
  });

  testWidgets('counters increment', (WidgetTester tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = Size(412, 915);

    await tester.pumpWidget(BMICalculator());

    final initialWeightFinder = find.descendant(
        of: find.byKey(Key('weightCard')),
        matching: find.descendant(
            of: find.byType(Row),
            matching: find.text('60')
        ),
    );

    expect(initialWeightFinder, findsOneWidget);

    final incrementButtonFinder = find.descendant(
        of: find.byKey(Key('weightCard')),
        matching: find.descendant(
            of: find.byType(Row),
            matching:
            find.byIcon(FontAwesomeIcons.plus)
        ),
    );

    await tester.tap(incrementButtonFinder);
    await tester.pump();

    final updatedWeightFinder = find.descendant(
        of: find.byKey(Key('weightCard')),
        matching: find.descendant(
            of: find.byType(Row),
            matching: find.text('61')
        ),
    );

    expect(updatedWeightFinder, findsOneWidget);
  });
}
