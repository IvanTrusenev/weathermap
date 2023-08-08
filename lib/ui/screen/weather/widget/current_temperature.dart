import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather_bloc.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/ui/style/text_style_book.dart';

class CurrentTemperature extends StatelessWidget {
  const CurrentTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherResponse>(
      buildWhen: (prev, cur) => prev.currentConditions.temp.toInt() != cur.currentConditions.temp.toInt(),
      builder: (context, state) {
        return Align(
          alignment: Alignment.center,
          child: Text('${state.currentConditions.temp.toInt()}º', style: TextStyleBook.temperature),
        );
      },
    );
  }
}
