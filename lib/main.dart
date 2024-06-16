import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFF090C22),
          scaffoldBackgroundColor: const Color(0xFF090C22),

          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Colors.white,
              )
          )
      ),
      home: const InputPage(),
    );
  }
}

