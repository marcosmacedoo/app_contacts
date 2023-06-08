import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String labelText;
  PrimaryButton({
    super.key,
    required this.labelText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                backgroundColor: Colors.yellow[600],
              ),
              child: Text(labelText)),
        ));
  }
}
