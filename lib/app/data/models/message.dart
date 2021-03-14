import 'dart:convert';

class ModelMessage {
  ModelMessage({
    this.statusCode,
    this.statusMessage,
  });

  int statusCode;
  String statusMessage;

  factory ModelMessage.fromRawJson(String str) => ModelMessage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelMessage.fromJson(Map<String, dynamic> json) => ModelMessage(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        statusMessage: json["status_message"] == null ? null : json["status_message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "status_message": statusMessage == null ? null : statusMessage,
      };
}
