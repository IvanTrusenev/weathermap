// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_conditions_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherConditionsEntityAdapter
    extends TypeAdapter<WeatherConditionsEntity> {
  @override
  final int typeId = 2;

  @override
  WeatherConditionsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherConditionsEntity(
      datetimeInt: fields[0] == null ? 0 : fields[0] as int,
      temp: fields[1] == null ? 0.0 : fields[1] as double,
      humidity: fields[2] == null ? 0 : fields[2] as int,
      windSpeed: fields[3] == null ? 0.0 : fields[3] as double,
      windDegree: fields[4] == null ? 0 : fields[4] as int,
      weatherDesc: fields[5] == null
          ? []
          : (fields[5] as List).cast<WeatherDescriptionEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherConditionsEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.datetimeInt)
      ..writeByte(1)
      ..write(obj.temp)
      ..writeByte(2)
      ..write(obj.humidity)
      ..writeByte(3)
      ..write(obj.windSpeed)
      ..writeByte(4)
      ..write(obj.windDegree)
      ..writeByte(5)
      ..write(obj.weatherDesc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherConditionsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
