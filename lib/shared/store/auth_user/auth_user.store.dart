import 'package:flutter/widgets.dart';
import 'package:main/shared/services/linkedin.service.dart';
import 'package:mobx/mobx.dart';
import '../../services/user.service.dart';
import '../../../locator.dart';
import '../../services/facebook.service.dart';
import '../../services/google.service.dart';
import '../../services/graphql.service.dart';
import '../../services/financial.service.dart';
import '../../models/auth_user.model.dart';
import '../../../routes.dart';

part 'auth_user.store.g.dart';

class AuthUserStore = _AuthUserStore with _$AuthUserStore;

abstract class _AuthUserStore with Store {
  final facebookService = locator<FacebookService>();
  final googleService = locator<GoogleService>();
  final linkedinService = locator<LinkedinService>();
  final financialService = locator<FinancialService>();
  final graphqlService = locator<GraphqlService>();
  final userService = locator<UserService>();

  @observable
  AuthUser authUser;

  @computed
  bool get loggedIn {
    return (authUser != null) ? true : false;
  }

  @action
  Future<bool> loginFacebook() async {
    final data = await facebookService.login();
    if (data == null) {
      return false;
    }
    authUser = AuthUser.fromJson(data);
    graphqlService.authToken = 'Bearer ${authUser.token}';
    return true;
  }

  @action
  Future<bool> loginGoogle() async {
    final dynamic data = await googleService.login();
    if (!data) {
      return false;
    }
    authUser = AuthUser.fromJson(data);
    graphqlService.authToken = 'Bearer ${authUser.token}';
    return true;
  }

  @action
  Future<bool> loginLinkedin(BuildContext context) async {
    final dynamic data = await linkedinService.login(context);
    if (data == null) {
      return false;
    }
    authUser = AuthUser.fromJson(data);
    graphqlService.authToken = 'Bearer ${authUser.token}';
    return true;
  }

  @action
  Future<AuthUser> logout() async {
    await Routes.sailor.navigate(
      RouteNames.login,
    );
    authUser = null;
    graphqlService.authToken = null;
    await googleService.googleSignIn.signOut();
    return null;
  }

  @action
  Future connectFinancialInstitution(BuildContext context) async {
    await financialService.connectFinancialInstitution(context);
    return true;
  }

  saveUserApi(AuthUser user) {
    if (user != null) {
      return userService.editProfile(user);
    } else {
      return userService.editProfile(authUser);
    }
  }

  @action
  Future<bool> saveUserApiAlternatte(AuthUser user) async {
    final data = await userService.editProfileAlternate(user);
    authUser = authUser.update(data);
    return true;
  }
}
