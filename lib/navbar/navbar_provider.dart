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
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Icon(icon,
            size: 40,
            color: isSelected
                ? Colors.grey
                : const Color.fromARGB(255, 36, 86, 127) //true gri, false mavi
            ),

         Positioned(
          //ICON ALTINDAKİ LABEL - HATALI
          bottom: 0,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.grey
                  : const Color.fromARGB(255, 36, 86, 127),
            ),
          ),
        ), 
      ],
    ),
  );
}