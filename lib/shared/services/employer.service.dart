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

    if (result.data != null) {
      return result.data['whoami'];
    }
  }

  Future verifyEmployer(String employerEmail, int income) async {
    var mutation = '''
    mutation {
        verifyEmployer(input: {
          employerEmail: "$employerEmail",
          income: $income,
        }
    ){
        success
        userEmployer{
          employerVerifiedAt
          createdAt
        }
      }
    }
    ''';
    final result = await graphqlService.mutate(mutation);
    print(result.errors);
    return result.data;
  }
}
