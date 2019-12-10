import 'package:graphql/client.dart';
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
      // if (result.errors != null) {
      //   print('error');
      //   print(result.errors);
      // }
      return result.data['updateUser']['user'];
    }
  }

  Future uploadFile(dynamic file) async {
    print(file);
  }
}
