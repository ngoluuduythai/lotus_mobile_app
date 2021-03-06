import 'package:json_annotation/json_annotation.dart';
import './financial_institution.model.dart';
import './user_employer.model.dart';
import "package:merge_map/merge_map.dart";
part 'auth_user.model.g.dart';

@JsonSerializable(nullable: true, anyMap: true)
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
    this.profileDescription,
    this.monthlyRentalBudget,
    this.notifyByEmail,
    this.notifyByText,
    this.notifyInApp,
    this.showInRoommateSearch,
    this.financialInstitutions,
    this.currentEmployer,
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
  String profileDescription;
  bool notifyByEmail;
  bool notifyByText;
  bool notifyInApp;
  bool showInRoommateSearch;
  num monthlyRentalBudget;
  List<FinancialInstitution> financialInstitutions;
  UserEmployer currentEmployer;

  static List<String> updateableFields = [
    'profileDescription',
    'lastName',
    'nickName',
    'gender',
    'phone',
    'firstName',
    'showInRoommateSearch',
    'notifyByEmail',
    'notifyByText',
    'notifyInApp',
  ];

  bool get connectedFinancialInstiutiton {
    if (financialInstitutions == null) {
      return false;
    }
    return financialInstitutions.isEmpty ? false : true;
  }

  bool get currentEmployervalue {
    if (currentEmployer == null) {
      return false;
    }
    return currentEmployer == null ? false : true;
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

  String get profilePictureUrl {
    if (pictureUrl == null || pictureUrl.isEmpty) {
      pictureUrl =
          'https://graph.facebook.com/103708797720366/picture?type=normal';
      return pictureUrl;
    }
    return pictureUrl;
  }

  void set setProfilePictureUrl(String url) {
    pictureUrl = url;
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
    json['financialInstitutions'] =
        (json['financialInstitutions'] as List)?.map((e) {
      if (e is FinancialInstitution) {
        return Map<String, dynamic>.from(e.toJson());
      } else if (e == null) {
        return null;
      } else {
        return Map<String, dynamic>.from(e);
      }
    })?.toList();

    if (json['currentEmployer'] is UserEmployer) {
      json['currentEmployer'] =
          Map<dynamic, dynamic>.from(json['currentEmployer'].toJson());
    }

    return _$AuthUserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    var json = _$AuthUserToJson(this);
    // json['financialInstitutions'] = this.financialInstitutions.map((e)=>e.toJson());
    return json;
  }
}
