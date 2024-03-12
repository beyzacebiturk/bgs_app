import 'package:flutter/material.dart';

class FavButton extends StatelessWidget {
  final bool isStarred;
  final Function(bool) onPressed;

  const FavButton(
      {super.key, required this.isStarred, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isStarred ? Icons.star : Icons.star_border,
        color: isStarred ? Colors.yellow : null,
      ),
      onPressed: () {
        onPressed(!isStarred);
      },
    );
  }
}

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
}
