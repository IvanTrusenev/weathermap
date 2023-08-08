import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class AirConditions extends StatelessWidget {
  const AirConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherResponse>(
      buildWhen: (prev, cur) =>
          prev.currentConditions.humidity != cur.currentConditions.humidity ||
          prev.currentConditions.windSpeed.toInt() != cur.currentConditions.windSpeed.toInt(),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
          child: Container(
            height: 96.h,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.20000000298023224),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/Wind.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: SizedBox(
                        width: 56.w,
                        child: Text('${state.currentConditions.windSpeed.toInt()}', style: TextStyleBook.airConditionVague),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                            _windDirection(
                              state.currentConditions.windDegree,
                              state.currentConditions.windSpeed.toInt(),
                            ),
                            style: TextStyleBook.airConditionWhite),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/images/Drop.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.scaleDown,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: SizedBox(
                        width: 56.w,
                        child: Text('${state.currentConditions.humidity}', style: TextStyleBook.airConditionVague),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(_humidityLevel(state.currentConditions.humidity), style: TextStyleBook.airConditionWhite),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _windDirection(int degree, int windSpeed) {
    if (windSpeed == 0) return 'Штиль';

    if (degree >= 0 && degree < 23) {
      return 'Ветер северный';
    } else if (degree >= 23 && degree < 68) {
      return 'Ветер северо-восточный';
    } else if (degree >= 68 && degree < 113) {
      return 'Ветер восточный';
    } else if (degree >= 113 && degree < 158) {
      return 'Ветер юго-восточный';
    } else if (degree >= 158 && degree < 203) {
      return 'Ветер южный';
    } else if (degree >= 203 && degree < 248) {
      return 'Ветер юго-западный';
    } else if (degree >= 248 && degree < 293) {
      return 'Ветер западный';
    } else if (degree >= 293 && degree < 338) {
      return 'Ветер северо-западный';
    } else {
      return 'Ветер северный';
    }
  }

  String _humidityLevel(int humidity) {
    if (humidity >= 80) {
      return 'Высокая влажность';
    } else if (humidity >= 60) {
      return 'Средняя влажность';
    } else {
      return 'Низкая влажность';
    }
  }
}
