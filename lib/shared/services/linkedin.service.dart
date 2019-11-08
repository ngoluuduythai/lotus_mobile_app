import 'package:main/locator.dart';
import './graphql.service.dart';

class LinkedinService {
  final graphqlService = locator<GraphqlService>();

  Future<dynamic> login(String authCode) async {
    return graphqlService.socialLogin(authCode, 'LINKEDIN');
  }
}
