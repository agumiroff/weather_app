import 'package:weather_app/weather/domain/models/data_model.dart';

class FindColdestTemp {
  WeatherDataModel findColdestTemp(List<WeatherDataModel> weatherData) {
    WeatherDataModel coldestTemperatureModel = weatherData.first;
    for (var element in weatherData) {
      if (double.parse(element.temperature) < double.parse(coldestTemperatureModel.temperature)) {
        coldestTemperatureModel = element;
      }
    }
    return coldestTemperatureModel;
  }
}
