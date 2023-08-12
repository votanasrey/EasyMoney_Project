// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.address,
    this.userProfile,
    required this.kycVerified,
    this.phoneNumberVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String gender;
  DateTime dateOfBirth;
  String address;
  dynamic userProfile;
  bool kycVerified;
  dynamic phoneNumberVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneNumber: json["phone_number"],
    gender: json["gender"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    address: json["address"],
    userProfile: json["user_profile"],
    kycVerified: json["kyc_verified"],
    phoneNumberVerifiedAt: json["phone_number_verified_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "phone_number": phoneNumber,
    "gender": gender,
    "date_of_birth": dateOfBirth.toIso8601String(),
    "address": address,
    "user_profile": userProfile,
    "kyc_verified": kycVerified,
    "phone_number_verified_at": phoneNumberVerifiedAt,
  };
}
