// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_employer.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEmployer _$UserEmployerFromJson(Map json) {
  return UserEmployer(
    employerVerifiedAt: json['employerVerifiedAt'] as String,
    employer: json['employer'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$UserEmployerToJson(UserEmployer instance) =>
    <String, dynamic>{
      'employerVerifiedAt': instance.employerVerifiedAt,
      'createdAt': instance.createdAt,
      'employer': instance.employer,
    };
