// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthUser> _$authUserSerializer = new _$AuthUserSerializer();

class _$AuthUserSerializer implements StructuredSerializer<AuthUser> {
  @override
  final Iterable<Type> types = const [AuthUser, _$AuthUser];
  @override
  final String wireName = 'AuthUser';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.firstName != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(object.lastName,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.token != null) {
      result
        ..add('token')
        ..add(serializers.serialize(object.token,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    if (object.created != null) {
      result
        ..add('created')
        ..add(serializers.serialize(object.created,
            specifiedType: const FullType(DateTime)));
    }
    if (object.list != null) {
      result
        ..add('list')
        ..add(serializers.serialize(object.list,
            specifiedType:
                const FullType(BuiltList, const [const FullType(int)])));
    }
    return result;
  }

  @override
  AuthUser deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(int)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$AuthUser extends AuthUser {
  @override
  final int id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String token;
  @override
  final String location;
  @override
  final DateTime created;
  @override
  final BuiltList<int> list;

  factory _$AuthUser([void Function(AuthUserBuilder) updates]) =>
      (new AuthUserBuilder()..update(updates)).build();

  _$AuthUser._(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.token,
      this.location,
      this.created,
      this.list})
      : super._();

  @override
  AuthUser rebuild(void Function(AuthUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthUserBuilder toBuilder() => new AuthUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthUser &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        phone == other.phone &&
        email == other.email &&
        token == other.token &&
        location == other.location &&
        created == other.created &&
        list == other.list;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), firstName.hashCode),
                                lastName.hashCode),
                            phone.hashCode),
                        email.hashCode),
                    token.hashCode),
                location.hashCode),
            created.hashCode),
        list.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthUser')
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('phone', phone)
          ..add('email', email)
          ..add('token', token)
          ..add('location', location)
          ..add('created', created)
          ..add('list', list))
        .toString();
  }
}

class AuthUserBuilder implements Builder<AuthUser, AuthUserBuilder> {
  _$AuthUser _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  DateTime _created;
  DateTime get created => _$this._created;
  set created(DateTime created) => _$this._created = created;

  ListBuilder<int> _list;
  ListBuilder<int> get list => _$this._list ??= new ListBuilder<int>();
  set list(ListBuilder<int> list) => _$this._list = list;

  AuthUserBuilder();

  AuthUserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _phone = _$v.phone;
      _email = _$v.email;
      _token = _$v.token;
      _location = _$v.location;
      _created = _$v.created;
      _list = _$v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthUser;
  }

  @override
  void update(void Function(AuthUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthUser build() {
    _$AuthUser _$result;
    try {
      _$result = _$v ??
          new _$AuthUser._(
              id: id,
              firstName: firstName,
              lastName: lastName,
              phone: phone,
              email: email,
              token: token,
              location: location,
              created: created,
              list: _list?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
