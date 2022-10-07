class WeatherDataModel {
  //Модель для отображния данных в удобном формате
  final int temperature;
  final double windSpeed;
  final int humidity;
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
      weather: json['weather'][0]['main'] as String,
      temperature: (json['main']['temp']).round()
          as int, //присылает иногда инт а иногда дабл, что вызывает ошибки, поэтому пришлось округлить до инта
      windSpeed: json['wind']['speed'] as double,
      humidity: json['main']['humidity'],
    );
  }
}
