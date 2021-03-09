import 'dart:convert';
import 'package:hive/hive.dart';

part 'genres.g.dart';

@HiveType(typeId: 3)
class Genre {
  Genre({
    this.id,
    this.name,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String name;

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
