import 'dart:convert';

class ModelAccountState {
  ModelAccountState({
    this.id,
    this.favorite,
    this.rated,
    this.watchList,
  });

  int id;
  bool favorite;
  dynamic rated;
  bool watchList;

  factory ModelAccountState.fromRawJson(String str) => ModelAccountState.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelAccountState.fromJson(Map<String, dynamic> json) => ModelAccountState(
        id: json["id"] == null ? null : json["id"],
        favorite: json["favorite"] == null ? null : json["favorite"],
        rated: json["rated"],
        watchList: json["watchlist"] == null ? null : json["watchlist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "favorite": favorite == null ? null : favorite,
        "rated": rated,
        "watchlist": watchList == null ? null : watchList,
      };
}

class RatedClass {
  RatedClass({
    this.value,
  });

  int value;

  factory RatedClass.fromRawJson(String str) => RatedClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RatedClass.fromJson(Map<String, dynamic> json) => RatedClass(
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
      };
}
