import 'dart:async';
import 'package:main/locator.dart';
import 'package:main/shared/models/auth_user.model.dart';
import './graphql.service.dart';

class UserService {
  final graphqlService = locator<GraphqlService>();

  Future editProfile(String change) async {
    final result = await graphqlService.mutate('''
      mutation {
        updateProfile(
          firstname : "'$change'"
        ) {
          firstname
        }
      }
    ''');
    return result.data;
  }
}
