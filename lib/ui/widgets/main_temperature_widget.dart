import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempMainLabel extends StatelessWidget {
  final String cityName;
  final String temperature;
  final String windSpeed;
  final String humidity;

  const TempMainLabel({
    Key? key,
    required this.cityName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${cityName[0].toUpperCase()}${cityName.substring(1)}',
          style: TextStyle(fontSize: 50.sp, color: Colors.white),
        ),
        Text(
          '$temperature F',
          style: TextStyle(fontSize: 50.sp, color: Colors.white),
        ),
        Text(
          'wind speed: $windSpeed',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        Text(
          'humidity: $humidity',
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
      ],
    );
  }
}
