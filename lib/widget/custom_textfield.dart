import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.onchange,
      this.inputType});
  String labelText;
  String hintText;

  Function(String) onchange;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        onChanged: onchange,
        keyboardType: inputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 5),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black, fontSize: 17),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black, fontSize: 17),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
