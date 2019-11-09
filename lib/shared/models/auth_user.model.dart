import 'package:json_annotation/json_annotation.dart';

part 'auth_user.model.g.dart';

@JsonSerializable(nullable: false)
class AuthUser {
  AuthUser({
    this.userKey,
    this.email,
    this.phone,
    this.token,
    this.pictureUrl,
    this.firstName,
    this.lastName,
    this.nickName,
    this.gender,
    this.monthlyRentalBudget,
  });

  final num userKey;
  final String email;
  final String phone;
  final String token;
  final String pictureUrl;
  final String firstName;
  final String lastName;
  final String nickName;
  final String gender;
  final num monthlyRentalBudget;

  String get fullName {
    String fullName = '';

    if (firstName != null) {
      fullName += '$firstName ';
    }

    if (lastName != null) {
      fullName += '$lastName';
    }
    return fullName;
  }

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
