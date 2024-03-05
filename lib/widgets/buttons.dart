import 'package:flutter/material.dart';

//butonlar değişecek bunlar kullanılmıyor artık
//favori yıldız buton koyulabilir

class FavButton extends StatelessWidget {
  final bool isStarred;
  final Function(bool) onPressed;

  const FavButton({super.key, required this.isStarred, required this.onPressed});
  
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