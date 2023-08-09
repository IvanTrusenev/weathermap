import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/weather/weather_bloc.dart';
import 'package:weathermap/bloc/weather/weather_state.dart';
import 'package:weathermap/ui/style/color_book.dart';

class CurrentConditions extends StatelessWidget {
  const CurrentConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) {
        if (prev.response.currentConditions.weatherDesc.isNotEmpty && cur.response.currentConditions.weatherDesc.isNotEmpty) {
          return prev.response.currentConditions.weatherDesc.first.main != cur.response.currentConditions.weatherDesc.first.main;
        }
        return true;
      },
      builder: (context, state) {
        late final String main;
        if (state.response.currentConditions.weatherDesc.isNotEmpty) {
          main = state.response.currentConditions.weatherDesc.first.main;
        } else {
          main = '';
        }

        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 194.w,
            height: 190.h,
            child: Stack(
              children: <Widget>[
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50, tileMode: TileMode.decal),
                  child: const CircleAvatar(
                    backgroundColor: ColorBook.blurryCircle,
                    radius: 100,
                  ),
                ),
                Image(image: AssetImage(_getAssetImage(main)), fit: BoxFit.fill),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getAssetImage(String main) {
    switch (main.toLowerCase()) {
      case 'thunderstorm':
        return 'assets/images/Big-CloudLightning.png';
      case 'drizzle':
        return 'assets/images/Big-CloudRain.png';
      case 'rain':
        return 'assets/images/Big-CloudRainfall.png';
      case 'snow':
        return 'assets/images/Big-CloudSnow.png';
      case 'clear':
        return 'assets/images/Big-Sun.png';
    }

    return 'assets/images/Big-Sun.png';
  }
}
