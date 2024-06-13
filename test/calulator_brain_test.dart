import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/calculator_brain.dart';

void main() {
  group('test the calculating capabilities of the BMI calculator itself', () {
    test('returns BMI when input is correct', () {
      expect(() => CalculatorBrain(height: 130, weight: 50), returnsNormally);
    });

    test('gives error for negative numbers', () {
      expect(() => CalculatorBrain(height: -1, weight: 50), throwsException);
      expect(() => CalculatorBrain(height: 125, weight: -1), throwsException);
      expect(() => CalculatorBrain(height: -1, weight: -1), throwsException);
    });

    test('gives error for numbers under the height or weight minimum', () {
      expect(() => CalculatorBrain(height: 119, weight: 50), throwsException);
      expect(() => CalculatorBrain(height: 120, weight: 24), throwsException);
      expect(() => CalculatorBrain(height: 119, weight: 24), throwsException);
    });

    test('calculates the correct BMI', () {
      CalculatorBrain calcOver = CalculatorBrain(height: 160, weight: 80);
      expect(calcOver.calculateBMI(), '31.3');

      CalculatorBrain calcNormal = CalculatorBrain(height: 170, weight: 70);
      expect(calcNormal.calculateBMI(), '24.2');

      CalculatorBrain calcUnder = CalculatorBrain(height: 180, weight: 50);
      expect(calcUnder.calculateBMI(), '15.4');
    });
  });

  group('test whether the result and the interpretation are also correct', () {
    test('gives correct interpretation and result for overweight', () {
      CalculatorBrain calc = CalculatorBrain(height: 160, weight: 80);
      calc.calculateBMI(); // Calculate BMI to update the _bmi field
      expect(calc.getInterpretation(), 'You have a higher than normal body weight. Try ot exercise more.');
      expect(calc.getResult(), 'Overweight');
    });

    test('gives correct interpretation and result for normal weight', () {
      CalculatorBrain calc = CalculatorBrain(height: 170, weight: 70);
      calc.calculateBMI();
      expect(calc.getInterpretation(), 'You have a normal body weight. Good job!');
      expect(calc.getResult(), 'Normal');
    });

    test('gives correct interpretation and result for underweight', () {
      CalculatorBrain calc = CalculatorBrain(height: 180, weight: 50);
      calc.calculateBMI();
      expect(calc.getInterpretation(), 'You have a lower than normal body weight. You can eat a bit more.');
      expect(calc.getResult(), 'Underweight');
    });
  });
}