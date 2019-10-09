import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:main/constants/env.dart';
import 'package:flutter/material.dart';

class GraphqlService {

  static HttpLink httpLink = HttpLink(
    uri: ENV.graphqlApiUrl,
  );

  static GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: InMemoryCache(),
  );

  ValueNotifier<GraphQLClient> notifierClient = ValueNotifier(client);

  Future query(String document) {
    return client.query(QueryOptions(
      document: document,
    )).catchError((e) {
      print(e);
    });
  }
}