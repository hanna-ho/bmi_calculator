import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Key? cardKey;
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  const ReusableCard({super.key, this.cardKey, required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: cardKey,
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
