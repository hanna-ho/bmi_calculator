import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  final String IconText;
  final IconData IconChosen;

  const IconContent({super.key, required this.IconText, required this.IconChosen});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconChosen,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          IconText,
          style: const TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}