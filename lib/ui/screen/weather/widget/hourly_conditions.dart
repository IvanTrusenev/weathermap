import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class HourlyConditions extends StatelessWidget {
  const HourlyConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherResponse>(
      buildWhen: (prev, cur) => prev.currentConditions.datetimeInt != cur.currentConditions.datetimeInt,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.20000000298023224),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            height: 230.h,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 56.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Сегодня', style: TextStyleBook.button.copyWith(color: ColorBook.white)),
                        Text(_currentDate(state.currentConditions.dateTime), style: TextStyleBook.airConditionWhite),
                      ],
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: ColorBook.white),
              ],
            ),
          ),
        );
      },
    );
  }

  String _currentDate(DateTime dateTime) {
    final int month = dateTime.month;
    late final String monthName;
    switch (month) {
      case 1:
        monthName = 'января';
        break;
      case 2:
        monthName = 'февраля';
        break;
      case 3:
        monthName = 'марта';
        break;
      case 4:
        monthName = 'апреля';
        break;
      case 5:
        monthName = 'мая';
        break;
      case 6:
        monthName = 'июня';
        break;
      case 7:
        monthName = 'июля';
        break;
      case 8:
        monthName = 'августа';
        break;
      case 9:
        monthName = 'сентября';
        break;
      case 10:
        monthName = 'октября';
        break;
      case 11:
        monthName = 'ноября';
        break;
      case 12:
        monthName = 'декабря';
        break;
    }

    return '${dateTime.day} $monthName';
  }
}
