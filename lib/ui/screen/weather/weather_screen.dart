import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/event/weather_request_event.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/screen/weather/widget/air_conditions.dart';
import 'package:weathermap/ui/screen/weather/widget/current_conditions.dart';
import 'package:weathermap/ui/screen/weather/widget/current_conditions_description.dart';
import 'package:weathermap/ui/screen/weather/widget/current_temperature.dart';
import 'package:weathermap/ui/screen/weather/widget/current_temperature_range.dart';
import 'package:weathermap/ui/screen/weather/widget/hourly_conditions.dart';
import 'package:weathermap/ui/screen/weather/widget/location.dart';
import 'package:weathermap/ui/style/color_book.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (BuildContext context) => WeatherBloc(const WeatherResponse.empty())..add(const WeatherRequestEvent(lat: 39.099724, lon: -94.578331)),
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.21, -0.98),
              end: Alignment(-0.21, 0.98),
              colors: <Color>[
                ColorBook.weatherGradientStart,
                ColorBook.weatherGradientEnd,
              ],
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: const Column(
              children: <Widget>[
                Location(),
                CurrentConditions(),
                CurrentTemperature(),
                CurrentConditionsDescription(),
                CurrentTemperatureRange(),
                HourlyConditions(),
                AirConditions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
