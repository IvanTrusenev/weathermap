import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/bloc/weather_state.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class CurrentTemperature extends StatelessWidget {
  const CurrentTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      buildWhen: (prev, cur) => prev.response.currentConditions.temp.toInt() != cur.response.currentConditions.temp.toInt(),
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Text('${state.response.currentConditions.temp.toInt()}º', style: TextStyleBook.temperature),
        );
      },
    );
  }
}
