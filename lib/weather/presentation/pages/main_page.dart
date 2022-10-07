import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/pages/error_page.dart';
import 'package:weather_app/weather/presentation/pages/start_page.dart';
import 'package:weather_app/weather/presentation/pages/three_days_weather_page.dart';
import '../bloc/weather_app_bloc.dart';
import 'city_weather_page.dart';

class WeatherAppMainPage extends StatelessWidget {
  const WeatherAppMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherAppBloc, WeatherAppStates>(
      builder: (context, state) {
        if (state is WeatherAppStartState) {
          return StartPage(
            controller: state.textEditingController,
          );
        }
        if (state is WeatherInCityState) {
          return CityWeatherPage(
            temperature: state.weatherData.temperature,
            windSpeed: state.weatherData.windSpeed.toString(),
            humidity: state.weatherData.humidity.toString(),
            cityName: state.cityName,
            assetImage: state.assetImage,
          );
        }
        if (state is WeatherAppLoadingState) {
          return const Material(child: Center(child: CircularProgressIndicator()));
        }
        if (state is ThreeDaysWeatherState) {
          return ThreeDaysWeather(
            cityName: state.cityName,
            assetImage: state.assetImage,
            listOfWeather: state.weatherData,
            coldestModel: state.coldestModel,
          );
        }
        if (state is WeatherAppErrorState) {
          return ErrorPage(errorMessage: state.errorMessage.toString());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
