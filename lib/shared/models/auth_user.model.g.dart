// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map json) {
  return AuthUser(
    userKey: json['userKey'] as num,
    email: json['email'] as String,
    phone: json['phone'] as String,
    token: json['token'] as String,
    pictureUrl: json['pictureUrl'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    nickName: json['nickName'] as String,
    gender: json['gender'] as String,
    profileDescription: json['profileDescription'] as String,
    monthlyRentalBudget: json['monthlyRentalBudget'] as num,
    notifyByEmail: json['notifyByEmail'] as bool,
    notifyByText: json['notifyByText'] as bool,
    notifyInApp: json['notifyInApp'] as bool,
    showInRoommateSearch: json['showInRoommateSearch'] as bool,
    financialInstitutions: (json['financialInstitutions'] as List)
        ?.map((e) => e == null
            ? null
            : FinancialInstitution.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
    currentEmployer: json['currentEmployer'] == null
        ? null
        : UserEmployer.fromJson((json['currentEmployer'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'userKey': instance.userKey,
      'email': instance.email,
      'phone': instance.phone,
      'token': instance.token,
      'pictureUrl': instance.pictureUrl,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'nickName': instance.nickName,
      'gender': instance.gender,
      'profileDescription': instance.profileDescription,
      'notifyByEmail': instance.notifyByEmail,
      'notifyByText': instance.notifyByText,
      'notifyInApp': instance.notifyInApp,
      'showInRoommateSearch': instance.showInRoommateSearch,
      'monthlyRentalBudget': instance.monthlyRentalBudget,
      'financialInstitutions': instance.financialInstitutions,
      'currentEmployer': instance.currentEmployer,
    };
