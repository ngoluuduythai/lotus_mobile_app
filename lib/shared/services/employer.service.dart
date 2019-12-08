import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:main/shared/models/financial_institution.model.dart';
import 'package:plaid/plaid.dart';
import 'package:flutter/material.dart';
import '../constants/env.dart';
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
        createdAt
        }
      }
    }
    ''');
    return result.data['whoami'];
  }
}
