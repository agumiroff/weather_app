class WeatherDataModel {
  //Модель для отображния данных в удобном формате
  final String temperature;
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
      weather: json['weather'][0]['main'] as String,
      temperature: (json['main']['temp'])
          .toString(), //присылает иногда инт а иногда дабл, что вызывает ошибки, поэтому решил все переводить в строку
      windSpeed: (json['wind']['speed'])
          .toString(), //присылает иногда инт а иногда дабл, что вызывает ошибки, поэтому решил все переводить в строку
      humidity: (json['main']['humidity']).toString(),
    );
  }
}
