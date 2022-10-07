import 'package:weather_app/weather/domain/models/data_model.dart';

class WallpaperChange {
  wallpaperChange(WeatherDataModel weatherData) {
    String assetImage;
    switch (weatherData.weather.toLowerCase()) {
      case 'rain':
        {
          assetImage = 'images/rain.jpg';
        }
        break;
      case 'clear':
        {
          assetImage = 'images/clear.png';
        }
        break;
      case 'clouds':
        {
          assetImage = 'images/clouds.jpg';
        }
        break;
      default:
        {
          assetImage = 'images/rain.jpg';
        }
    }
    return assetImage;
  }
}
