import 'package:main/locator.dart';
import 'package:main/services/graphql.service.dart';

class GoogleService {
  final _graphqlService = locator<GraphqlService>();

  sendIdToken(String token) async {
    var result = await _graphqlService.query("""
        query{
          socialLogin(
            token: "$token",
            platform: GOOGLE
          ){
            email
            firstName
            lastName
            token
          }
        }
        """);
    return result.data['socialLogin'];
  }
}
