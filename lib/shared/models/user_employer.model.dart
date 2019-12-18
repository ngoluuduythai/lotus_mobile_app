import 'package:json_annotation/json_annotation.dart';
part 'user_employer.model.g.dart';

@JsonSerializable(nullable: true, anyMap: true)
class UserEmployer {
  UserEmployer({this.employerVerifiedAt, this.employer, this.createdAt});

  String employerVerifiedAt;
  String createdAt;
  String employer;

  factory UserEmployer.fromJson(Map<String, dynamic> json) =>
      _$UserEmployerFromJson(json);
  Map<dynamic, dynamic> toJson() => _$UserEmployerToJson(this);
}
