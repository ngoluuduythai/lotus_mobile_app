// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financial_institution.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinancialInstitution _$FinancialInstitutionFromJson(Map<String, dynamic> json) {
  return FinancialInstitution(
    financialInstitutionKey: json['financialInstitutionKey'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$FinancialInstitutionToJson(
        FinancialInstitution instance) =>
    <String, dynamic>{
      'financialInstitutionKey': instance.financialInstitutionKey,
      'name': instance.name,
    };
