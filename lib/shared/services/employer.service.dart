import 'package:main/locator.dart';
import './graphql.service.dart';
// import '../../pac/plaid.dart';

class EmployerService {
  final graphqlService = locator<GraphqlService>();

  getCurrentEmployer() async {
    final result = await graphqlService.query('''
  query{
      whoami{
        currentEmployer{
          createdAt
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
    ''');
    return result.data['whoami'];
  }
}
