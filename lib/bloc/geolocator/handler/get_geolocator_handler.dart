import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathermap/bloc/geolocator/event/get_geolocator_event.dart';
import 'package:weathermap/bloc/geolocator/geolocator_state.dart';

Future<void> getGeolocatorHandler(
  GetGeolocatorEvent event,
  Emitter<GeolocatorState> emit,
) async {
  final Position? position = await _getCurrentPosition();

  final double lat = position?.latitude ?? .0;
  final double lon = position?.longitude ?? .0;

  emit(GeolocatorState(
    lat: lat,
    lon: lon,
  ));
}

Future<Position?> _getCurrentPosition() async {
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;

  final hasPermission = await _handlePermission();
  if (!hasPermission) return null;

  return await geolocatorPlatform.getCurrentPosition();
}

Future<bool> _handlePermission() async {
  final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;

  /// Test if location services are enabled.
  final bool serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
  if (!serviceEnabled) return false;

  /// Check location service permission
  LocationPermission permission = await geolocatorPlatform.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await geolocatorPlatform.requestPermission();
    if (permission == LocationPermission.denied) return false;
  }

  /// Check if permission denied permanently
  if (permission == LocationPermission.deniedForever) return false;

  return true;
}
