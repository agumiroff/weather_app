import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/styles/text_styles.dart';
import 'package:weather_app/ui/widgets/main_temperature_widget.dart';
import 'package:weather_app/weather/domain/use_cases/day_from_date.dart';
import 'package:weather_app/weather/presentation/bloc/weather_app_bloc.dart';
import '../../../ui/widgets/appbar_button_widget.dart';
import '../../domain/models/data_model.dart';

class ThreeDaysWeather extends StatelessWidget {
  final WeatherDataModel coldestModel;
  final List<WeatherDataModel> listOfWeather;
  final String assetImage;
  final String cityName;

  const ThreeDaysWeather(
      {Key? key,
      required this.assetImage,
      required this.cityName,
      required this.listOfWeather,
      required this.coldestModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherAppBloc weatherAppBloc = BlocProvider.of<WeatherAppBloc>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const Spacer(flex: 2),
        ]),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              TempMainLabel(
                // выводит самое холодное значение температуры
                cityName: cityName,
                temperature: coldestModel.temperature,
                windSpeed: coldestModel.windSpeed.toString(),
                humidity: coldestModel.humidity.toString(),
              ),
              const SizedBox(height: 50),
              const HeaderRow(),
              ColdestTempRow(coldestModel: coldestModel),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Opacity(opacity: 0.5, child: Divider(height: 2, color: Colors.white)),
                      Column(
                        //Лист с данными из модели, по которому мы идем, что б вытащить все данные за 3 дня
                        //все данные оборачиваются в SizedBoxы, для корректного отображения
                        children: listOfWeather
                            .map((e) => Row(
                                  children: [
                                    SizedBox(
                                        height: 40,
                                        width: 100,
                                        child: Text(DayData.dayData[DateTime.parse(e.weatherDate).weekday].toString(),
                                            style: AppTextStyles.simpleTextStyle)),
                                    const Spacer(),
                                    SizedBox(
                                      height: 40,
                                      width: 80,
                                      child: Text(e.humidity.toString(), style: AppTextStyles.simpleTextStyle),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 80,
                                      child: Text(e.windSpeed.toString(), style: AppTextStyles.simpleTextStyle),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 80,
                                      child: Text(e.temperature.toString(), style: AppTextStyles.simpleTextStyle),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Виджет строки с самой холодной температурой
class ColdestTempRow extends StatelessWidget {
  final WeatherDataModel coldestModel;
  const ColdestTempRow({Key? key, required this.coldestModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)),
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 80,
                child: Text(DayData.dayData[DateTime.parse(coldestModel.weatherDate).weekday].toString(),
                    style: AppTextStyles.simpleTextStyle)),
            const Spacer(),
            SizedBox(
              width: 80,
              child: Text(coldestModel.humidity.toString(), style: AppTextStyles.simpleTextStyle),
            ),
            SizedBox(
              width: 80,
              child: Text(coldestModel.windSpeed.toString(), style: AppTextStyles.simpleTextStyle),
            ),
            SizedBox(
              width: 80,
              child: Text(coldestModel.temperature.toString(), style: AppTextStyles.simpleTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}

//Виджет строки заголовков таблицы
class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: const [
          SizedBox(
              width: 90,
              child: Center(child: Text('День', textAlign: TextAlign.center, style: AppTextStyles.tableHeaderStyle))),
          Spacer(),
          SizedBox(
            width: 100,
            child: Align(
                alignment: Alignment.center,
                child: Text('Влажность', textAlign: TextAlign.center, style: AppTextStyles.tableHeaderStyle)),
          ),
          SizedBox(
            width: 90,
            child: Align(
                alignment: Alignment.center,
                child: Text('Скорость ветра', textAlign: TextAlign.center, style: AppTextStyles.tableHeaderStyle)),
          ),
          SizedBox(height: 55, width: 90, child: Center(child: Icon(Icons.thermostat, size: 40, color: Colors.white))),
        ],
      ),
    );
  }
}
