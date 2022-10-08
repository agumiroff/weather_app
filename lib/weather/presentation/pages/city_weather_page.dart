import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../ui/widgets/appbar_button_widget.dart';
import '../bloc/weather_app_bloc.dart';

class CityWeatherPage extends StatelessWidget {
  final String assetImage;
  final String cityName;
  final String temperature;
  final String windSpeed;
  final String humidity;

  const CityWeatherPage({
    super.key,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.cityName,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    WeatherAppBloc weatherAppBloc = BlocProvider.of<WeatherAppBloc>(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFFE6E6E9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.6),
          title: Row(children: [
            AppBarButton(
                onPressed: () {
                  weatherAppBloc.add(ResetEvent());
                },
                buttonText: 'Cancel'),
            const Spacer(),
            Text(
              '${cityName[0].toUpperCase()}${cityName.substring(1)}',
              style: TextStyle(color: Colors.black, fontSize: 20.sp),
            ),
            const Spacer(),
            AppBarButton(
                onPressed: () {
                  weatherAppBloc.add(ShowThreeDaysWeather(cityName: cityName));
                },
                buttonText: 'Next'),
          ]),
        ),
        body: DecoratedBox(
          //DecoratedBox для фонового рисунка в зависимости от погоды
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(assetImage),
            fit: BoxFit.cover,
          )),
          child: Center(
            //сам виджет данных о погоде
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Text(
                  '${cityName[0].toUpperCase()}${cityName.substring(1)}',
                  style: TextStyle(fontSize: 70.sp, color: Colors.white),
                ),
                Text(
                  '$temperature F',
                  style: TextStyle(fontSize: 70.sp, color: Colors.white),
                ),
                Text(
                  'wind speed: $windSpeed',
                  style: TextStyle(fontSize: 30.sp, color: Colors.white),
                ),
                Text(
                  'humidity: $humidity',
                  style: TextStyle(fontSize: 30.sp, color: Colors.white),
                ),
                const Spacer(flex: 3),
              ],
            ),
          ),
        ));
  }
}

