import 'package:flutter/material.dart';

class MessageTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const MessageTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          //Mesaj Öneri TextFormField
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 36, 86, 127), width: 3),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 36, 86, 127),
                width: 2,
              ),
            ),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          validator: validator,
          onSaved: onSaved,
        ),
       
      ],
    );
  }
}

class LoginTextFormField extends StatelessWidget {    // Login işlemleri TextFormField
  final TextEditingController controller;

  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const LoginTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          // Login işlemleri TextFormField
          controller: controller,
          decoration: InputDecoration(
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 227, 79, 128), width: 3),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 227, 79, 128),
                width: 2,
              ),
            ),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
