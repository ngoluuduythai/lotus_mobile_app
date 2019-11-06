import 'dart:async';
import 'package:main/locator.dart';
import 'package:main/shared/models/auth_user.model.dart';
import './graphql.service.dart';

class UserService {
  final graphqlService = locator<GraphqlService>();

  Future editProfile(AuthUser user) async {
    final result = await graphqlService.mutate('''
      mutation {
        updateProfile(
          input: "$user"
        ) {
          userKey
        }
      }
    ''');
    return result.data;
  }
}
