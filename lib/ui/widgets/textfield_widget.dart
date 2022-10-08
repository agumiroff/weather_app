import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        style: TextStyle(color: Colors.black, fontSize: 18.sp),
        decoration: InputDecoration(
          hintText: 'Название города',
          hintStyle: TextStyle(color: const Color(0xFFC6C6C7), fontSize: 18.sp),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE9E9EA), width: 2),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE9E9EA), width: 2),
          ),
        ),
      ),
    );
  }
}
