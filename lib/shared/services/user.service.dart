import 'dart:async';
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
      if(value != null) {
        mutation = mutation+'\n$key:"$value",';
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
}
