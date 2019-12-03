// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthUserStore on _AuthUserStore, Store {
  Computed<bool> _$loggedInComputed;

  @override
  bool get loggedIn =>
      (_$loggedInComputed ??= Computed<bool>(() => super.loggedIn)).value;

  final _$authUserAtom = Atom(name: '_AuthUserStore.authUser');

  @override
  AuthUser get authUser {
    _$authUserAtom.context.enforceReadPolicy(_$authUserAtom);
    _$authUserAtom.reportObserved();
    return super.authUser;
  }

  @override
  set authUser(AuthUser value) {
    _$authUserAtom.context.conditionallyRunInAction(() {
      super.authUser = value;
      _$authUserAtom.reportChanged();
    }, _$authUserAtom, name: '${_$authUserAtom.name}_set');
  }

  final _$loginFacebookAsyncAction = AsyncAction('loginFacebook');

  @override
  Future<bool> loginFacebook() {
    return _$loginFacebookAsyncAction.run(() => super.loginFacebook());
  }

  final _$loginGoogleAsyncAction = AsyncAction('loginGoogle');

  @override
  Future<bool> loginGoogle() {
    return _$loginGoogleAsyncAction.run(() => super.loginGoogle());
  }

  final _$loginLinkedinAsyncAction = AsyncAction('loginLinkedin');

  @override
  Future<bool> loginLinkedin(BuildContext context) {
    return _$loginLinkedinAsyncAction.run(() => super.loginLinkedin(context));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<AuthUser> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$connectFinancialInstitutionAsyncAction =
      AsyncAction('connectFinancialInstitution');

  @override
  Future connectFinancialInstitution(BuildContext context) {
    return _$connectFinancialInstitutionAsyncAction
        .run(() => super.connectFinancialInstitution(context));
  }

  final _$disconnectFinancialInstitutionAsyncAction =
      AsyncAction('disconnectFinancialInstitution');

  @override
  Future disconnectFinancialInstitution(int financialInstitutionKey) {
    return _$disconnectFinancialInstitutionAsyncAction.run(
        () => super.disconnectFinancialInstitution(financialInstitutionKey));
  }

  final _$getFinancialInstitutionsAsyncAction =
      AsyncAction('getFinancialInstitutions');

  @override
  Future getFinancialInstitutions() {
    return _$getFinancialInstitutionsAsyncAction
        .run(() => super.getFinancialInstitutions());
  }

  final _$saveUserApiAlternatteAsyncAction =
      AsyncAction('saveUserApiAlternatte');

  @override
  Future<bool> saveUserApiAlternatte(AuthUser user) {
    return _$saveUserApiAlternatteAsyncAction
        .run(() => super.saveUserApiAlternatte(user));
  }

  final _$_AuthUserStoreActionController =
      ActionController(name: '_AuthUserStore');

  @override
  Future saveUserApi(AuthUser user) {
    final _$actionInfo = _$_AuthUserStoreActionController.startAction();
    try {
      return super.saveUserApi(user);
    } finally {
      _$_AuthUserStoreActionController.endAction(_$actionInfo);
    }
  }
}
