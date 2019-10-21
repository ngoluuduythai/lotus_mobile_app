import 'package:flutter/widgets.dart';
import 'package:flutter_plaid/flutter_plaid.dart';
import 'package:main/services/google.service.dart';
import 'package:mobx/mobx.dart';
import 'package:main/models/auth_user.model.dart';
import 'package:main/locator.dart';
import 'package:main/services/facebook.service.dart';
import 'package:main/services/plaid.service.dart';


part 'auth_user.store.g.dart';

class AuthUserStore = _AuthUserStore with _$AuthUserStore;

abstract class _AuthUserStore with Store {
  final facebookService = locator<FacebookService>();
  final googleService = locator<GoogleService>();
  final plaidService = locator<PlaidService>();

  @observable
  AuthUser authUser;

  @observable
  int count = 0;

  @action 
  void increment() {
    count++;
  }

  @action 
  void decrement() {
    count--;
  }

  @action
  Future<AuthUser> login() async {
    var data = await facebookService.login();
    this.authUser = AuthUser.fromJson(data);
    print('token ${this.authUser.token}');
    return this.authUser;
  }

  @action
  Future addBankAccount(BuildContext context) async {
    Result data = await plaidService.addBankAccount(context);
    print("token");
    print(data.token);
    print(data.toString());
    return true;
  }
}