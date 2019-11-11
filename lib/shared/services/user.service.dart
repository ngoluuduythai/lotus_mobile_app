import 'dart:async';
import 'package:main/locator.dart';
import '../../routes/profile/sub_routes/personal_information/user.dart';
import './graphql.service.dart';

class UserService {
  final graphqlService = locator<GraphqlService>();



  Future editProfile(User user) async {
      String firstname = user.firstname;
      String lastname = user.lastname;
      String gender = user.gender;
      String email = user.email;
      String phone = user.phone;

    final result = await graphqlService.mutate('''
      mutation {
        updateProfile(
          firstname : '$firstname',
          lastname : '$lastname',
          gender : '$gender',
          email :  '$email',
          phone :  '$phone',
        ) {
          firstname,
          lastname,
          gender,
          email,
          phone
        }
      }
    ''');
    return result.data;
  }
}
