import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/geolocator/event/base/geolocator_base_event.dart';
import 'package:weathermap/bloc/geolocator/event/get_geolocator_event.dart';
import 'package:weathermap/bloc/geolocator/geolocator_state.dart';
import 'package:weathermap/bloc/geolocator/handler/get_geolocator_handler.dart';

class GeolocatorBloc extends Bloc<GeolocatorBaseEvent, GeolocatorState> {
  GeolocatorBloc(super.initialState) {
    on<GetGeolocatorEvent>(getGeolocatorHandler);
  }
}
