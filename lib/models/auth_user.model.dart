import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:main/models/serializers.dart';

part 'auth_user.model.g.dart';

/// An example user model that should be serialized.
///   - @nullable: means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     recieve from an API
abstract class AuthUser implements Built<AuthUser, AuthUserBuilder> {
  static Serializer<AuthUser> get serializer => _$authUserSerializer;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get phone;

  @nullable
  String get email;

  @nullable
  String get token;

  @nullable
  String get location;

  @nullable
  DateTime get created;

  @nullable
  BuiltList<int> get list;

  String toJson() {
    return json.encode(serializers.serializeWith(AuthUser.serializer, this));
  }

  static AuthUser fromJson(json) {
    return serializers.deserializeWith(
      AuthUser.serializer,
      json,
    );
  }

  AuthUser._();
  factory AuthUser([void Function(AuthUserBuilder) updates]) = _$AuthUser;
}
