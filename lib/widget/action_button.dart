import 'package:flutter/material.dart';

class ElevButton extends StatelessWidget {
  const ElevButton(this.onPressd, this.text, {super.key});
  final Function()? onPressd;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressd,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepOrangeAccent,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
