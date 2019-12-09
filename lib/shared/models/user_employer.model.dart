import 'package:json_annotation/json_annotation.dart';
part 'user_employer.model.g.dart';

@JsonSerializable(nullable: false, anyMap: true)
class UserEmployer {
  UserEmployer({this.employerVerifiedAt, this.name});

  String employerVerifiedAt;
  String name;

  factory UserEmployer.fromJson(Map<String,dynamic> json) =>
  _$UserEmployerFromJson(json);
  Map<String,dynamic> toJson() => _$UserEmployerToJson(this);
}