import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Text('Подтвердить',
            style: TextStyle(
              color: const Color(0xFF0174FF),
              fontSize: 18.sp,
            )));
  }
}
