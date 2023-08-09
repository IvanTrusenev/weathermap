import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathermap/bloc/event/select_current_conditions_event.dart';
import 'package:weathermap/bloc/event/select_hourly_conditions_event.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_conditions.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class HourlyConditionsItem extends StatelessWidget {
  const HourlyConditionsItem({
    super.key,
    required this.response,
    required this.weatherConditions,
    required this.isSelected,
  });

  final WeatherResponse response;
  final WeatherConditions weatherConditions;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected) {
          context.read<WeatherBloc>().add(SelectCurrentConditionsEvent(response: response));
        } else {
          context.read<WeatherBloc>().add(SelectHourlyConditionsEvent(response: response, selectedConditions: weatherConditions));
        }
      },
      child: isSelected ? _SelectedConditions(weatherConditions: weatherConditions) : _UnselectedConditions(weatherConditions: weatherConditions),
    );
  }

  static String _getAssetImage(String main) {
    switch (main.toLowerCase()) {
      case 'thunderstorm':
        return 'assets/images/Small-CloudLightning.png';
      case 'drizzle':
        return 'assets/images/Small-CloudRain.png';
      case 'rain':
        return 'assets/images/Small-CloudRain.png';
      case 'snow':
        return 'assets/images/Small-CloudSnow.png';
      case 'clear':
        return 'assets/images/Small-Sun.png';
    }

    return 'assets/images/Small-Sun.png';
  }
}

class _SelectedConditions extends StatelessWidget {
  const _SelectedConditions({
    required this.weatherConditions,
  });

  final WeatherConditions weatherConditions;

  String get main {
    if (weatherConditions.weatherDesc.isNotEmpty) {
      return weatherConditions.weatherDesc.first.main;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.4000000059604645),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(weatherConditions.hourMinute, style: TextStyleBook.airConditionWhite),
          SizedBox(
            width: 32.w,
            height: 32.h,
            child: Image(image: AssetImage(HourlyConditionsItem._getAssetImage(main)), fit: BoxFit.fill),
          ),
          Text('${weatherConditions.temp.toInt()}º', style: TextStyleBook.b1.copyWith(color: ColorBook.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _UnselectedConditions extends StatelessWidget {
  const _UnselectedConditions({
    required this.weatherConditions,
  });

  final WeatherConditions weatherConditions;

  String get main {
    if (weatherConditions.weatherDesc.isNotEmpty) {
      return weatherConditions.weatherDesc.first.main;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74.w,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(weatherConditions.hourMinute, style: TextStyleBook.airConditionWhite),
          SizedBox(
            width: 32.w,
            height: 32.h,
            child: Image(image: AssetImage(HourlyConditionsItem._getAssetImage(main)), fit: BoxFit.fill),
          ),
          Text('${weatherConditions.temp.toInt()}º', style: TextStyleBook.b1.copyWith(color: ColorBook.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
