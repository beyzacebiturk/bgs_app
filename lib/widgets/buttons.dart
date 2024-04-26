import 'package:flutter/material.dart';

class MyButtons {
  static Widget paintedButton({
    required VoidCallback onPressed,
    required String buttonText,
  }) {
    return MaterialButton(
      minWidth: double.tryParse('350'),
      height: 55,
      onPressed: onPressed,
      color: const Color.fromARGB(255, 36, 86, 127),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 36, 86, 127),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          letterSpacing: 2,
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget transparentButton({
    required VoidCallback onPressed,
    required String buttonText,
  }) {
    return MaterialButton(
      minWidth: double.tryParse('350'),
      height: 55,
      onPressed: onPressed,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 36, 86, 127),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          letterSpacing: 2,
          color: Color.fromARGB(255, 36, 86, 127),
        ),
      ),
    );
  }

  static Widget reportButton({
    required VoidCallback onPressed,
    required String buttonText,
    required bool isSelected,
  }) {
    return MaterialButton(
      minWidth: double.tryParse('350'),
      height: 40,
      onPressed: onPressed,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: isSelected ? Colors.grey[350] : Colors.green[800],
      child: Text(
        buttonText,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
