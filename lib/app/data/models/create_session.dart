import 'dart:convert';

class ModelCreateSession {
  ModelCreateSession({
    this.statusMessage,
    this.success,
    this.statusCode,
    this.sessionId,
  });

  String statusMessage;
  bool success;
  int statusCode;
  String sessionId;

  factory ModelCreateSession.fromRawJson(String str) => ModelCreateSession.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelCreateSession.fromJson(Map<String, dynamic> json) => ModelCreateSession(
        statusMessage: json["status_message"] == null ? null : json["status_message"],
        success: json["success"] == null ? null : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        sessionId: json["session_id"] == null ? null : json["session_id"],
      );

  Map<String, dynamic> toJson() => {
        "status_message": statusMessage == null ? null : statusMessage,
        "success": success == null ? null : success,
        "status_code": statusCode == null ? null : statusCode,
        "session_id": sessionId == null ? null : sessionId,
      };
}
