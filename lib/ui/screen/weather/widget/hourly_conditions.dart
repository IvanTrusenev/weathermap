import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/weather/weather_bloc.dart';
import 'package:weathermap/bloc/weather/weather_state.dart';
import 'package:weathermap/ui/screen/weather/widget/hourly_conditions_item.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class HourlyConditions extends StatelessWidget {
  const HourlyConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) => prev.selectedConditions.datetimeInt != cur.selectedConditions.datetimeInt,
      builder: (context, state) {
        late final List<Widget> widgetList;
        if (state.response.hourlyConditions.isNotEmpty) {
          widgetList = state.response.hourlyConditions
              .where((weatherConditions) => weatherConditions.dateTime.day == DateTime.now().day)
              .map((weatherConditions) => HourlyConditionsItem(
                    response: state.response,
                    weatherConditions: weatherConditions,
                    isSelected: !state.isCurrent && state.selectedConditions.datetimeInt == weatherConditions.datetimeInt,
                  ))
              .toList(growable: false);
        } else {
          widgetList = [];
        }

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
                        Text(_currentDate(state.response.currentConditions.dateTime), style: TextStyleBook.airConditionWhite),
                      ],
                    ),
                  ),
                ),
                const Divider(thickness: 1, color: ColorBook.white),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: widgetList),
                    ),
                  ),
                ),
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
