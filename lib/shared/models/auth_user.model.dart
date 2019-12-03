import 'package:json_annotation/json_annotation.dart';
import './financial_institution.model.dart';
import "package:merge_map/merge_map.dart";
part 'auth_user.model.g.dart';

@JsonSerializable(nullable: false, anyMap: true)
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
    this.financialInstitutions,
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

  static List<String> updateableFields = [
    'phone',
    'firstName',
    'notifyByEmail',
    'notifyByText',
    'notifyInApp'
  ];

  bool get connectedFinancialInstiutiton {
    if(financialInstitutions == null) {
      return false;
    }
    return financialInstitutions.isEmpty ? false : true;
  }
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
    return AuthUser.fromJson(finalMerged);
  }

  // factory AuthUser.fromJson(Map<String, dynamic> json) =>
  //     _$AuthUserFromJson(json);
  factory AuthUser.fromJson(Map json) {
    json['financialInstitutions'] = (json['financialInstitutions'] as List)
          ?.map((e) {
            if(e is FinancialInstitution) {
              return Map<String, dynamic>.from(e.toJson());
            } else if ( e == null) {
              return null;
            } else {
              return Map<String, dynamic>.from(e);
            }
          })
          ?.toList();
    return _$AuthUserFromJson(json);  
  }
  Map<String, dynamic> toJson(){
    var json = _$AuthUserToJson(this);
    // json['financialInstitutions'] = this.financialInstitutions.map((e)=>e.toJson());
    return json;
  }
}
