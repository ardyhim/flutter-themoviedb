import 'dart:convert';

class ModelSessionWithLogin {
  ModelSessionWithLogin({
    this.success,
    this.expiresAt,
    this.requestToken,
  });

  bool success;
  String expiresAt;
  String requestToken;

  factory ModelSessionWithLogin.fromRawJson(String str) => ModelSessionWithLogin.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelSessionWithLogin.fromJson(Map<String, dynamic> json) => ModelSessionWithLogin(
        success: json["success"] == null ? null : json["success"],
        expiresAt: json["expires_at"] == null ? null : json["expires_at"],
        requestToken: json["request_token"] == null ? null : json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "expires_at": expiresAt == null ? null : expiresAt,
        "request_token": requestToken == null ? null : requestToken,
      };
}
