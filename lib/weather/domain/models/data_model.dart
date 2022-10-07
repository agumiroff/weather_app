class WeatherDataModel {
  //Модель для отображния данных в удобном формате
  final double temperature;
  final String windSpeed;
  final String humidity;
  final String weather;
  final String weatherDate;

  WeatherDataModel(
      {required this.weatherDate,
      required this.weather,
      required this.temperature,
      required this.windSpeed,
      required this.humidity});
//метод для расшифровки ДЖСОНА
  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {
    return WeatherDataModel(
      weatherDate: json['dt_txt'] as String,
      weather: json['weather'][0]['main'].toString(),
      temperature: json['main']['temp'] as double,
      windSpeed: json['wind']['speed'].toString(),
      humidity: json['main']['humidity'].toString(),
    );
  }
}
