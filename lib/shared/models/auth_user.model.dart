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
    this.notifyByEmail,
    this.notifyByText,
    this.notifyInApp,
    this.showInRoommateSearch,
  });

  final num userKey;
  String email;
  String phone;
  String token;
  String pictureUrl;
  String firstName;
  String lastName;
  String nickName;
  String gender;
  final num monthlyRentalBudget;
  bool notifyByEmail;
  bool notifyByText;
  bool notifyInApp;
  bool showInRoommateSearch;

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
