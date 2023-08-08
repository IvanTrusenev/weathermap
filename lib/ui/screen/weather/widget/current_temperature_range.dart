import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class CurrentTemperatureRange extends StatelessWidget {
  const CurrentTemperatureRange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherResponse>(
      builder: (context, state) {
        late final int temperatureMin;
        late final int temperatureMax;
        if (state.hourlyConditions.isNotEmpty) {
          temperatureMin = state.hourlyConditions.map((e) => e.temp).reduce((cur, next) => cur > next ? next : cur).toInt();
          temperatureMax = state.hourlyConditions.map((e) => e.temp).reduce((cur, next) => cur > next ? cur : next).toInt();
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
