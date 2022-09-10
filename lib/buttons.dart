import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final buttonText;
  final buttonColor;
  final textColor;
  final pressed;

  Buttons({this.buttonText, this.buttonColor, this.textColor, this.pressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 25,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
