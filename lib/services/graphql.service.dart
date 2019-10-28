import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

class GraphqlService {
  String graphqlUrl;
  HttpLink httpLink;
  AuthLink authLink;
  Link link;
  GraphQLClient client;
  ValueNotifier<GraphQLClient> notifierClient;

  String _authToken = ''; // be sure to set and remove at login and logout.

  set authToken(String token) {
    this._authToken = token;
  }

  get authToken {
    return _authToken;
  }

  GraphqlService({@required this.graphqlUrl}) {
    httpLink = HttpLink(
      uri: graphqlUrl,
    );

    authLink = AuthLink(
      getToken: () {
        print('auth toekn being used: ${this.authToken}');
        return this.authToken;
      },
    );

    link = authLink.concat(httpLink);
    client = GraphQLClient(
      link: link,
      cache: InMemoryCache(),
    );

    notifierClient = ValueNotifier(client);
  }

  Future query(String document) {
    print(document);
    return client
        .query(QueryOptions(
      document: document,
    ))
        .catchError((e) {
      print(e);
    });
  }

  Future<QueryResult> mutate(String document) {
    return client
        .mutate(MutationOptions(
      document: document,
    ))
        .catchError((e) {
      print(e);
    });
  }
}
