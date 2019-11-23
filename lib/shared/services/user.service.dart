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
      mutation updateUser(
        $input: UpdateUserInput
      ){
        updateUser(input: $input){
          user{
            notifyInApp
            notifyByText
            notifyByEmail
            showInRoommateSearch
          }
        }
      }
    ''';

    var userJson = user.toJson();

    // clean null variables
    userJson.keys
        .where((k) => userJson[k] == null)
        .toList()
        .forEach(userJson.remove);

    print(userJson);
    final MutationOptions _options = MutationOptions(
      document: document,
      variables: {'input': userJson},
    );

    final result = await graphqlService.mutateOptions(_options);
    if (result.errors != null) {
      print('error');
      print(result.errors);
    }
    return result.data['updateUser']['user'];
  }

  Future uploadFile(File file) async {
    print(file);
  }
}
