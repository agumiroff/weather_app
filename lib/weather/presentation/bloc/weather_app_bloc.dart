//==============================================States==============================================

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/weather/domain/use_cases/find_coldest_temperature.dart';
import 'package:weather_app/weather/domain/use_cases/wallpaper_change.dart';

import '../../domain/models/data_model.dart';
import '../../domain/repository/api_request.dart';

abstract class WeatherAppStates {}

class WeatherAppStartState extends WeatherAppStates {
  TextEditingController textEditingController;

  WeatherAppStartState({required this.textEditingController});
}

class WeatherInCityState extends WeatherAppStates {
  final String assetImage;
  final String cityName;
  final WeatherDataModel weatherData;

  WeatherInCityState({required this.assetImage, required this.weatherData, required this.cityName});
}

class WeatherAppErrorState extends WeatherAppStates {
  final Error errorMessage;

  WeatherAppErrorState(this.errorMessage);
}

class WeatherAppLoadingState extends WeatherAppStates {}

class ThreeDaysWeatherState extends WeatherAppStates {
  final String assetImage;
  final String cityName;
  final WeatherDataModel coldestModel;
  final List<WeatherDataModel> weatherData;

  ThreeDaysWeatherState({
    required this.coldestModel,
    required this.assetImage,
    required this.cityName,
    required this.weatherData,
  });
}

//==============================================Events==============================================
abstract class WeatherAppEvents {}

class ResetEvent extends WeatherAppEvents {}

class ShowWeatherInCity extends WeatherAppEvents {
  final String cityName;
  ShowWeatherInCity({required this.cityName});
}

class ShowThreeDaysWeather extends WeatherAppEvents {
  final String cityName;

  ShowThreeDaysWeather({required this.cityName});
}

class WeatherAppBloc extends Bloc<WeatherAppEvents, WeatherAppStates> {
  WeatherAppBloc() : super(WeatherAppStartState(textEditingController: TextEditingController())) {
    on<ResetEvent>((event, emit) {
      emit(WeatherAppStartState(textEditingController: TextEditingController()));
    });
    on<ShowWeatherInCity>((event, emit) async {
      emit(WeatherAppLoadingState());
      try {
        List<WeatherDataModel> weatherData = await Repository(cityName: event.cityName).parseUrl();
        String assetImage = await WallpaperChange().wallpaperChange(weatherData.first);
        print(weatherData.first);
        emit(WeatherInCityState(weatherData: weatherData.first, cityName: event.cityName, assetImage: assetImage));
      } on Error catch (error) {
        print('===============================ERROR==========================$error');
      }
    });
    on<ShowThreeDaysWeather>((event, emit) async {
      WeatherDataModel coldestTemperatureModel;
      emit(WeatherAppLoadingState());
      try {
        List<WeatherDataModel> weatherData = await Repository(cityName: event.cityName)
            .parseUrl(); // Получаем лист с данными о погоде в выбранном городе
        weatherData.removeWhere((element) => DateTime.parse(element.weatherDate)
            .isAfter(DateTime.now().add(const Duration(days: 2)))); // Удаляем ненужные дни из листа
        coldestTemperatureModel = FindColdestTemp().findColdestTemp(
            weatherData); // Проходим по всем элементам листа и находим элемент с самой низкой температурой
        String assetImage =
            await WallpaperChange().wallpaperChange(weatherData.first); //выбираем обои, в зависимости от погоды
        emit(ThreeDaysWeatherState(
            weatherData: weatherData,
            cityName: event.cityName,
            assetImage: assetImage,
            coldestModel: coldestTemperatureModel));
      } on Error catch (error) {
        print('===============================ERROR==========================$error');
      }
    });
  }
}
