import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const TextFieldWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: const InputDecoration(
          hintText: 'Название города',
          hintStyle: TextStyle(color: Color(0xFFC6C6C7), fontSize: 18),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE9E9EA), width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE9E9EA), width: 2),
          ),
        ),
      ),
    );
  }
}
