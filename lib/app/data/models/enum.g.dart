// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MediaTypeAdapter extends TypeAdapter<MediaType> {
  @override
  final int typeId = 2;

  @override
  MediaType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MediaType.MOVIE;
      case 1:
        return MediaType.TV;
      case 2:
        return MediaType.ALL;
      case 3:
        return MediaType.PERSON;
      default:
        return MediaType.MOVIE;
    }
  }

  @override
  void write(BinaryWriter writer, MediaType obj) {
    switch (obj) {
      case MediaType.MOVIE:
        writer.writeByte(0);
        break;
      case MediaType.TV:
        writer.writeByte(1);
        break;
      case MediaType.ALL:
        writer.writeByte(2);
        break;
      case MediaType.PERSON:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
