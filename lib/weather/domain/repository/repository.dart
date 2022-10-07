import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../data/repository/keys.dart';
import '../models/data_model.dart';

class Repository {
  final String cityName; //название города для выполнения запроса

  Repository({required this.cityName});

  Future<List<WeatherDataModel>> parseUrl() async {
    final response = await http
        .get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${ApiKey.apiKey}'));
    var listOfJson =
        jsonDecode(response.body)['list'] as List<dynamic>; //достаем данные из Джсона из листа с название "лист"
    //преобразуем данные из листа и переводим это все в лист типа WeatherDataModel
    return listOfJson.map((dynamic e) => WeatherDataModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
