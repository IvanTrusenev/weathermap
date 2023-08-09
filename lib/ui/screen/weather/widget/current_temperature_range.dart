import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/bloc/weather_state.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class CurrentTemperatureRange extends StatelessWidget {
  const CurrentTemperatureRange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        late final int temperatureMin;
        late final int temperatureMax;
        if (state.response.hourlyConditions.isNotEmpty) {
          temperatureMin = state.response.hourlyConditions.map((e) => e.temp).reduce((cur, next) => cur > next ? next : cur).toInt();
          temperatureMax = state.response.hourlyConditions.map((e) => e.temp).reduce((cur, next) => cur > next ? cur : next).toInt();
        } else {
          temperatureMin = 0;
          temperatureMax = 0;
        }

        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              'Макс: $temperatureMaxº   Мин: $temperatureMinº',
              style: TextStyleBook.b1.copyWith(color: ColorBook.white),
            ),
          ),
        );
      },
    );
  }
}
