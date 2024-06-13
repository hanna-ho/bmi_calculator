class CalculatorBrain {
  final int height;
  final int weight;
  late double _bmi;

  CalculatorBrain({required this.height, required this.weight})
  {
    validateInput();
  }

  void validateInput() {
    if (height < 120) {
      throw Exception('Height should be at least 120 cm.');
    }
    if (weight < 25) {
      throw Exception('Weight should be at least 25 kg.');
    }
  }

  String calculateBMI() {
    _bmi = weight/(height*height)*10000;
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    if(_bmi >= 25) {
      return 'You have a higher than normal body weight. Try ot exercise more.';
    }
    else if(_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    }
    else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }

  }

  String getResult() {
    if(_bmi >= 25) {
      return 'Overweight';
    }
    else if(_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }
}