import 'package:flutter/material.dart';

class InputLarge extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  Widget? prefixIcon;
  void Function(String)? onChanged;

  InputLarge(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.labelText,
      this.prefixIcon,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration:
              InputDecoration(labelText: labelText, prefixIcon: prefixIcon)),
    );
  }
}
