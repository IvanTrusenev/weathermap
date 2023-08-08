import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class CurrentConditionsDescription extends StatelessWidget {
  const CurrentConditionsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherResponse>(
      buildWhen: (prev, cur) {
        if (prev.currentConditions.weatherDesc.isNotEmpty && cur.currentConditions.weatherDesc.isNotEmpty) {
          return prev.currentConditions.weatherDesc.first.description != cur.currentConditions.weatherDesc.first.description;
        }
        return true;
      },
      builder: (context, state) {
        late final String description;
        if (state.currentConditions.weatherDesc.isNotEmpty) {
          description = state.currentConditions.weatherDesc.first.description;
        } else {
          description = '';
        }

        return Align(
          alignment: Alignment.center,
          child: Text(description, style: TextStyleBook.b1.copyWith(color: ColorBook.white)),
        );
      },
    );
  }
}
