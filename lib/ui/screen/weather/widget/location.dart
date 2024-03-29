import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weathermap/bloc/weather/weather_bloc.dart';
import 'package:weathermap/bloc/weather/weather_state.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) => prev.response.timezone != cur.response.timezone,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          child: Row(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/pin.svg',
                width: 24,
                height: 24,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(state.response.timezone, style: TextStyleBook.airConditionVague.copyWith(color: ColorBook.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}
