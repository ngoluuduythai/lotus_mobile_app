import 'dart:async';
import 'dart:io';
import 'package:main/locator.dart';
import 'package:main/shared/models/auth_user.model.dart';
import './graphql.service.dart';

class EmployerService {
  final graphqlService = locator<GraphqlService>();

  Future verifyEmployer(String employerEmail, int income) async {
    var mutation = '''
    mutation {
        verifyEmployer(input: {
          employerEmail: "$employerEmail",
          income: $income,
        }
    ){
        success
      }
    }
    ''';
    final result = await graphqlService.mutate(mutation);
    print(result.errors);
    print(result.data);
    return result.data;
  }
}
