import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../ui/widgets/textbutton_widget.dart';
import '../../../ui/widgets/textfield_widget.dart';
import '../bloc/weather_app_bloc.dart';

class StartPage extends StatelessWidget {
  final TextEditingController controller;
  const StartPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text('Введите название города',
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 18.sp,
                  ))),
          backgroundColor: const Color(0xFFF8F8F8)),
      backgroundColor: const Color(0xFFE6E6E9),
      body: Center(
        child: SizedBox(
          height: 200.h,
          width: 350.w,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              children: [
                TextFieldWidget(
                  controller: controller,
                ),
                SizedBox(height: 10.h),
                TextButtonWidget(
                  onPressed: () {
                    BlocProvider.of<WeatherAppBloc>(context).add(ShowWeatherInCity(cityName: controller.text));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
