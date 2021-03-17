import 'dart:convert';

class ModelGuestSession {
  ModelGuestSession({
    this.success,
    this.guestSessionId,
    this.expiresAt,
  });

  bool success;
  String guestSessionId;
  String expiresAt;

  factory ModelGuestSession.fromRawJson(String str) => ModelGuestSession.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelGuestSession.fromJson(Map<String, dynamic> json) => ModelGuestSession(
        success: json["success"] == null ? null : json["success"],
        guestSessionId: json["guest_session_id"] == null ? null : json["guest_session_id"],
        expiresAt: json["expires_at"] == null ? null : json["expires_at"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "guest_session_id": guestSessionId == null ? null : guestSessionId,
        "expires_at": expiresAt == null ? null : expiresAt,
      };
}
