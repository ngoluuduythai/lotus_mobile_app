import 'package:flutter/widgets.dart';
import 'package:main/services/google.service.dart';
import 'package:mobx/mobx.dart';
import 'package:main/models/auth_user.model.dart';
import 'package:main/locator.dart';
import 'package:main/services/facebook.service.dart';
import 'package:main/services/plaid.service.dart';
import 'package:main/services/graphql.service.dart';

part 'auth_user.store.g.dart';

class AuthUserStore = _AuthUserStore with _$AuthUserStore;

abstract class _AuthUserStore with Store {
  final facebookService = locator<FacebookService>();
  final googleService = locator<GoogleService>();
  final plaidService = locator<PlaidService>();
  final graphqlService = locator<GraphqlService>();

  @observable
  AuthUser authUser;

  @computed
  bool get loggedIn {
    return (authUser != null) ? true : false;
  }

  @action
  Future<AuthUser> loginFacebook() async {
    final data = await facebookService.login();
    authUser = AuthUser.fromJson(data);
    graphqlService.authToken = 'Bearer ${authUser.token}';
    return authUser;
  }

  @action
  Future<AuthUser> loginGoogle() async {
    final data = await googleService.login();
    authUser = AuthUser.fromJson(data);
    graphqlService.authToken = 'Bearer ${authUser.token}';
    return authUser;
  }

  @action
  Future<AuthUser> logout() async {
    authUser = null;
    graphqlService.authToken = null;
    await googleService.googleSignIn.signOut();
    return null;
  }

  @action
  Future addBankAccount(BuildContext context) async {
    await plaidService.addBank(context);
    return true;
  }
}
