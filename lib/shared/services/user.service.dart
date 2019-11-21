import 'dart:async';
import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:main/locator.dart';
import 'package:main/shared/models/auth_user.model.dart';
import './graphql.service.dart';

class UserService {
  final graphqlService = locator<GraphqlService>();

  Future editProfile(AuthUser user) async {
    final userJson = user.toJson();

    var mutation = '''
    mutation {
        updateProfile(
    ''';
    userJson.forEach((String key, value) {
      if (value != null) {
        mutation = mutation + '\n$key:"$value",';
      }
    });
    mutation = mutation.substring(0, mutation.length - 1);
    mutation += '''
    ){
        firstName,
        lastName,
        email
      }
    }
    ''';
    final result = await graphqlService.mutate(mutation);
    print(result.errors);
    return result.data;
  }

  Future editProfileAlternate(AuthUser user) async {
    const String document = r'''
      mutation UpdateProfile(
          $firstName: String,
          $lastName: String,
          $phone: String,
          $nickName: String,
          $gender: GENDER_ENUM,
          $notifyByEmail: Boolean,
          $notifyByText: Boolean,
          $notifyInApp: Boolean,
          $showInRoommateSearch: Boolean
      ) {
        updateProfile(
          firstName: $firstName,
          lastName: $lastName,
          phone: $phone,
          nickName: $nickName,
          gender: $gender,
          notifyByEmail: $notifyByEmail,
          notifyByText: $notifyByText,
          notifyInApp: $notifyInApp,
          showInRoommateSearch: $showInRoommateSearch
              ){
            email
            firstName
            lastName
            nickName
            token
            gender
            pictureUrl
            notifyByEmail
            notifyByText
            notifyInApp
            showInRoommateSearch
      }
    }
    ''';

    var _variables = <String, dynamic>{
      'firstName': user.firstName,
      'lastName': user.lastName,
      'phone': user.phone,
      'nickName': user.nickName,
      'gender': user.gender,
      'notifyByEmail': user.notifyByEmail,
      'notifyByText': user.notifyByText,
      'notifyInApp': user.notifyInApp,
      'showInRoommateSearch': user.showInRoommateSearch
    };

    // clean null variables
    _variables.keys
        .where((k) => _variables[k] == null)
        .toList()
        .forEach(_variables.remove);

    final MutationOptions _options = MutationOptions(
      document: document,
      variables: _variables,
    );

    final result = await graphqlService.mutateOptions(_options);
    return result.data['updateProfile'];
  }

  Future uploadFile(File file) async {
    print(file);
  }
}
