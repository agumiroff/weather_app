import 'package:flutter/material.dart';

class TempMainLabel extends StatelessWidget {
  final String cityName;
  final int temperature;
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
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
        Text(
          '$temperature F',
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
        Text(
          'wind speed: $windSpeed',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          'humidity: $humidity',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
