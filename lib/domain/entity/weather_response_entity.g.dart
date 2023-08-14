// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherResponseEntityAdapter extends TypeAdapter<WeatherResponseEntity> {
  @override
  final int typeId = 3;

  @override
  WeatherResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherResponseEntity(
      lat: fields[0] == null ? 0.0 : fields[0] as double,
      lon: fields[1] == null ? 0.0 : fields[1] as double,
      timezone: fields[2] == null ? '' : fields[2] as String,
      currentConditions: fields[3] == null
          ? const WeatherConditionsEntity.empty()
          : fields[3] as WeatherConditionsEntity,
      hourlyConditions: fields[4] == null
          ? []
          : (fields[4] as List).cast<WeatherConditionsEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherResponseEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.currentConditions)
      ..writeByte(4)
      ..write(obj.hourlyConditions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
