import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/ui/styles/text_styles.dart';
import 'package:weather_app/weather/presentation/bloc/weather_app_bloc.dart';

import '../../../ui/widgets/appbar_button_widget.dart';

class ErrorPage extends StatefulWidget {
  final String errorMessage;
  const ErrorPage({super.key, required this.errorMessage});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    //Лист из 2-ух виджетов, подставляется в боди, в зависимости от того, что необходимо показывать
    List<Widget> listOfErrorScreenWidgets = [
      SnackBarWidget(
        errorMessage: widget.errorMessage,
        onPressed: () {
          index = 1;
          setState(() {});
        },
      ),
      const TextWidget(),
    ];
    WeatherAppBloc weatherAppBloc = BlocProvider.of<WeatherAppBloc>(context);
    return Scaffold(
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
              'Ошибка',
              style: TextStyle(color: Colors.black, fontSize: 20.sp),
            ),
            const Spacer(
              flex: 2,
            ),
          ]),
        ),
        body: listOfErrorScreenWidgets[index]);
  }
}

class SnackBarWidget extends StatelessWidget {
  // Виджет снэкбара, т.к реальный снэкбар невозможно разместить в центре экрана
  final String errorMessage;
  final VoidCallback onPressed;
  const SnackBarWidget({Key? key, required this.errorMessage, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 400,
        child: DecoratedBox(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            children: [
              Text(errorMessage, style: AppTextStyles.simpleTextStyle),
              SizedBox(height: 20.h),
              TextButton(onPressed: onPressed, child: Text('Cancel', style: TextStyle(fontSize: 20.sp))),
            ],
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  //Виджет ошибки получения данных
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ошибка получения данных'),
    );
  }
}
