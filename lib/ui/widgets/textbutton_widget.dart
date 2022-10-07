import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const TextButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: const Text('Подтвердить',
            style: TextStyle(
              color: Color(0xFF0174FF),
              fontSize: 18,
            )));
  }
}
