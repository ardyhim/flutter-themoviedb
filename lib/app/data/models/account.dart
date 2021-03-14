import 'dart:convert';

class ModelAccount {
  ModelAccount({
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username,
    this.statusCode,
    this.statusMessage,
  });

  Avatar avatar;
  int id;
  String iso6391;
  String iso31661;
  String name;
  bool includeAdult;
  String username;
  int statusCode;
  String statusMessage;

  factory ModelAccount.fromRawJson(String str) => ModelAccount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelAccount.fromJson(Map<String, dynamic> json) => ModelAccount(
        avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
        id: json["id"] == null ? null : json["id"],
        iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
        iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
        name: json["name"] == null ? null : json["name"],
        includeAdult: json["include_adult"] == null ? null : json["include_adult"],
        username: json["username"] == null ? null : json["username"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        statusMessage: json["status_message"] == null ? null : json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar.toJson(),
        "id": id == null ? null : id,
        "iso_639_1": iso6391 == null ? null : iso6391,
        "iso_3166_1": iso31661 == null ? null : iso31661,
        "name": name == null ? null : name,
        "include_adult": includeAdult == null ? null : includeAdult,
        "username": username == null ? null : username,
        "status_code": statusCode == null ? null : statusCode,
        "status_message": statusMessage == null ? null : statusMessage,
      };
}

class Avatar {
  Avatar({
    this.gravatar,
  });

  Gravatar gravatar;

  factory Avatar.fromRawJson(String str) => Avatar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        gravatar: json["gravatar"] == null ? null : Gravatar.fromJson(json["gravatar"]),
      );

  Map<String, dynamic> toJson() => {
        "gravatar": gravatar == null ? null : gravatar.toJson(),
      };
}

class Gravatar {
  Gravatar({
    this.hash,
  });

  String hash;

  factory Gravatar.fromRawJson(String str) => Gravatar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
        hash: json["hash"] == null ? null : json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "hash": hash == null ? null : hash,
      };
}
