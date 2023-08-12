// To parse this JSON data, do
//
//     final accessToken = accessTokenFromJson(jsonString);

import 'dart:convert';

AccessToken accessTokenFromJson(String str) => AccessToken.fromJson(json.decode(str));

String accessTokenToJson(AccessToken data) => json.encode(data.toJson());

class AccessToken {
  AccessToken({
    required this.accessToken,
    required this.token,
  });

  String accessToken;
  Token token;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
    accessToken: json["accessToken"],
    token: Token.fromJson(json["token"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "token": token.toJson(),
  };
}

class Token {
  Token({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.name,
    required this.scopes,
    required this.revoked,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
  });

  String id;
  int userId;
  String clientId;
  String name;
  List<dynamic> scopes;
  bool revoked;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime expiresAt;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    id: json["id"],
    userId: json["user_id"],
    clientId: json["client_id"],
    name: json["name"],
    scopes: List<dynamic>.from(json["scopes"].map((x) => x)),
    revoked: json["revoked"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expiresAt: DateTime.parse(json["expires_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "client_id": clientId,
    "name": name,
    "scopes": List<dynamic>.from(scopes.map((x) => x)),
    "revoked": revoked,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expires_at": expiresAt.toIso8601String(),
  };
}
