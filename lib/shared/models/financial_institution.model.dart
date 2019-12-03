import 'package:json_annotation/json_annotation.dart';

part 'financial_institution.model.g.dart';

@JsonSerializable(nullable: false, anyMap: true)
class FinancialInstitution {
  FinancialInstitution({this.financialInstitutionKey, this.name});

  int financialInstitutionKey;
  String name;

  factory FinancialInstitution.fromJson(Map<String, dynamic> json) =>
      _$FinancialInstitutionFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialInstitutionToJson(this);
}
