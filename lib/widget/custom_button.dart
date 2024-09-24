import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});
  String text;
  Color color;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: color),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
