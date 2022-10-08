import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AppBarButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(buttonText, style: TextStyle(fontSize: 20.sp)),
    );
  }
}
