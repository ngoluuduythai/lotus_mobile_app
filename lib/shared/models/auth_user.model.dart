import 'package:json_annotation/json_annotation.dart';
import './financial_institution.model.dart';
import "package:merge_map/merge_map.dart";
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
  bool notifyByEmail;
  bool notifyByText;
  bool notifyInApp;
  bool showInRoommateSearch;
  num monthlyRentalBudget;
  List<FinancialInstitution> financialInstitutions;

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

  update(Map<String, dynamic> json) {
    final originalJson = toJson();
    final Map merged = mergeMap([originalJson, json]);
    final Map finalMerged = new Map<String, dynamic>.from(merged);
    print('***********');
    print(finalMerged);
    return AuthUser.fromJson(finalMerged);
  }

  factory AuthUser.fromJson(Map<String, dynamic> json) =>
      _$AuthUserFromJson(json);
  Map<String, dynamic> toJson() => _$AuthUserToJson(this);
}
