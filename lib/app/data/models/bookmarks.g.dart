// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoreBookmarkAdapter extends TypeAdapter<StoreBookmark> {
  @override
  final int typeId = 1;

  @override
  StoreBookmark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoreBookmark(
      name: fields[0] as String,
      overview: fields[1] as String,
      voteAverage: fields[2] as double,
      posterPath: fields[3] as String,
      id: fields[4] as int,
      mediaType: fields[5] as MediaType,
      genres: (fields[6] as List)?.cast<Genre>(),
    );
  }

  @override
  void write(BinaryWriter writer, StoreBookmark obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.overview)
      ..writeByte(2)
      ..write(obj.voteAverage)
      ..writeByte(3)
      ..write(obj.posterPath)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.mediaType)
      ..writeByte(6)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoreBookmarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
