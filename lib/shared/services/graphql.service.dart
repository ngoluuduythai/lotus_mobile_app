import 'package:graphql/client.dart';
import 'package:flutter/material.dart';

class GraphqlService {
  GraphqlService({@required this.graphqlUrl}) {
    httpLink = HttpLink(
      uri: graphqlUrl,
    );

    authLink = AuthLink(
      getToken: () {
        print('auth token being used: $authToken');
        return authToken;
      },
    );

    link = authLink.concat(httpLink);
    client = GraphQLClient(link: link, cache: InMemoryCache());

    notifierClient = ValueNotifier(client);
  }

  String graphqlUrl;
  HttpLink httpLink;
  AuthLink authLink;
  Link link;
  GraphQLClient client;
  ValueNotifier<GraphQLClient> notifierClient;

  String _authToken = ''; // be sure to set and remove at login and logout.

  set authToken(String token) {
    print('setting auth token');
    _authToken = token;
  }

  String get authToken {
    return _authToken;
  }

  Future query(String document) {
    return client.query(
        QueryOptions(document: document, fetchPolicy: FetchPolicy.networkOnly));
  }

  Future queryWithOptions(QueryOptions queryOptions) {
    return client.query(queryOptions);
  }

  Future<QueryResult> mutate(String document) {
    return client.mutate(MutationOptions(
      document: document,
    ));
  }

  Future<QueryResult> mutateOptions(MutationOptions options) {
    return client.mutate(options);
  }
}
