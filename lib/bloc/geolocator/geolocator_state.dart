class GeolocatorState {
  const GeolocatorState({
    required this.lat,
    required this.lon,
  });

  const GeolocatorState.empty()
      : this(
          lat: .0,
          lon: .0,
        );

  final double lat;
  final double lon;
}
