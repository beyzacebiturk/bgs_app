import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

MaterialButton navbarIcon({
  required IconData icon,
  required VoidCallback onpressed,
  required bool isSelected,
  required String label,
}) {
  return MaterialButton(
    onPressed: onpressed,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 35,
          color:
              isSelected ? Colors.grey : const Color.fromARGB(255, 36, 86, 127),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isSelected
                ? Colors.grey
                : const Color.fromARGB(255, 36, 86, 127),
          ),
        ),
      ],
    ),
  );
} 