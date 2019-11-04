import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import './serializers.dart';

part 'auth_user.model.g.dart';

abstract class AuthUser implements Built<AuthUser, AuthUserBuilder> {
  factory AuthUser([void Function(AuthUserBuilder) updates]) = _$AuthUser;
  AuthUser._();

  static Serializer<AuthUser> get serializer => _$authUserSerializer;

  @nullable
  int get userKey;

  @nullable
  @BuiltValueField(wireName: 'firstName')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'lastName')
  String get lastName;

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

  @nullable
  String get phone;

  @nullable
  String get email;

  @nullable
  String get token;

  @nullable
  String get location;

  @nullable
  String get pictureUrl;

  @nullable
  String get nickName;

  @nullable
  String get birthday;

  @nullable
  DateTime get createdAt;

  @nullable
  BuiltList<int> get list;

  String toJson() {
    return json.encode(serializers.serializeWith(AuthUser.serializer, this));
  }

  static AuthUser fromJson(dynamic json) {
    return serializers.deserializeWith(
      AuthUser.serializer,
      json,
    );
  }
}
