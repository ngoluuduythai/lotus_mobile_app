import 'dart:async';
import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:main/locator.dart';
import 'package:main/shared/models/auth_user.model.dart';
import './graphql.service.dart';

class UserService {
  final graphqlService = locator<GraphqlService>();

  Future updateUser(AuthUser user) async {
    print("testing");
    const String document = r'''
      mutation updateUser(
        $input: UpdateUserInput
      ){
        updateUser(input: $input){
          user{
            firstName
            pictureUrl
            nickName
            gender
            profileDescription
            lastName
            phone
            notifyInApp
            notifyByText
            notifyByEmail
            showInRoommateSearch
          }
        }
      }
    ''';

    var userJson = user.toJson();
    print(userJson);
    // clean null variables
    userJson.keys
        .where((k) {
          return userJson[k] == null || !AuthUser.updateableFields.contains(k);
        })
        .toList()
        .forEach(userJson.remove);

    print('Returnned *****');
    print(userJson);
    if (userJson.isEmpty) {
      print('Not updating user information is empty');
      return null;
    } else {
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
  }

  Future uploadFile(File file) async {
    const String document = r'''
      mutation uploadFile(
        $file: Upload!
      ){
        uploadFile(file: $file){
        fileUrl
        fileName
        }
      }
    ''';

    final MutationOptions _options = MutationOptions(
      document: document,
      variables: {'file': file},
    );

    final result = await graphqlService.mutateOptions(_options);
    if (result.errors != null) {
      print('error');
      print(result.errors);
    }
    return result.data['uploadFile']['fileUrl'];
  }
}
