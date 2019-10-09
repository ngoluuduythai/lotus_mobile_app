import 'package:mobx/mobx.dart';
import 'package:main/models/auth_user.model.dart';
import 'package:main/locator.dart';
import 'package:main/services/facebook.service.dart';

part 'auth_user.store.g.dart';

class AuthUserStore = _AuthUserStore with _$AuthUserStore;

abstract class _AuthUserStore with Store {
  final facebookService = locator<FacebookService>();

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
    return this.authUser;
  }
}