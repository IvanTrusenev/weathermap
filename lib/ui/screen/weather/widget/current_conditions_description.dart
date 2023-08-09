import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/bloc/weather_state.dart';
import 'package:weathermap/ui/style/color_book.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class CurrentConditionsDescription extends StatelessWidget {
  const CurrentConditionsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) {
        if (prev.response.currentConditions.weatherDesc.isNotEmpty && cur.response.currentConditions.weatherDesc.isNotEmpty) {
          return prev.response.currentConditions.weatherDesc.first.description != cur.response.currentConditions.weatherDesc.first.description;
        }
        return true;
      },
      builder: (context, state) {
        late final String description;
        if (state.response.currentConditions.weatherDesc.isNotEmpty) {
          description = state.response.currentConditions.weatherDesc.first.description;
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
