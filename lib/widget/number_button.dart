import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final String digit;
  final void Function(String) onPressed;
  const NumberButton({super.key, required this.onPressed, required this.digit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      width: 105,
      child: ElevatedButton(
        onPressed: () {
          onPressed(digit);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.deepOrangeAccent,
          backgroundColor: Colors.white,
        ),
        child: Text(
          digit,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
