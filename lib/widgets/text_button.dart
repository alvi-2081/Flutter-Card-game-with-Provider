import 'package:flutter/material.dart';

class TxtButton extends StatelessWidget {
  const TxtButton(
      {Key? key, this.onPressed, this.text, this.textColor = Colors.white})
      : super(key: key);
  final Function()? onPressed;
  final String? text;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(color: textColor),
        ));
  }
}
