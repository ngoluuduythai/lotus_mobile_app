import 'package:graphql/client.dart';
import 'package:main/locator.dart';
import '../../shared/models/auth_user.model.dart';
import './graphql.service.dart';
import '../enums/social_login_enum.dart';

class UserService {
  final graphqlService = locator<GraphqlService>();

  Future socialLogin(String token, SOCIAL_LOGIN_ENUM platform) async {
    final platformName = platform.toString().split('.')[1];//because enums dont have an easy way to get their name in dart.
    final String document = r'''
      query socialLogin(
        $input: SocialLoginInput
      ){
        socialLogin(input: $input){
          user{
            nickName
            profileDescription
            phone
            email
            firstName
            lastName
            token
            gender
            pictureUrl
            notifyByEmail
            notifyByText
            notifyInApp
            showInRoommateSearch
            financialInstitutions {
              financialInstitutionKey
              name
            }
            currentEmployer{
              employerVerifiedAt
              createdAt
              employer{
                name
              }
            }
          }
        }
      }
    ''';

    final QueryOptions _options = QueryOptions(
      document: document,
      variables: {
        'input': {'token': token, 'platform': platformName}
      },
    );
    final QueryResult result = await graphqlService.queryWithOptions(_options);
    if(result.hasErrors) {
      print(result.hasErrors);
      throw 'Has exepection';
    }
    if(result.data == null) {
      throw 'data null';
    } else if(result.data['socialLogin'] == null) {
      print(result.data['socialLogin']);
      throw 'No User';
    } else {
      return result.data['socialLogin']['user'];
    }
  }

  Future updateUser(AuthUser user) async {
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
    userJson.keys
        .where((k) {
          return userJson[k] == null || !AuthUser.updateableFields.contains(k);
        })
        .toList()
        .forEach(userJson.remove);
    if (userJson.isEmpty) {
      return null;
    } else {
      final MutationOptions _options = MutationOptions(
        document: document,
        variables: {'input': userJson},
      );

      final result = await graphqlService.mutateOptions(_options);
      return result.data['updateUser']['user'];
    }
  }

  Future uploadFile(dynamic file) async {
    print(file);
  }
}
