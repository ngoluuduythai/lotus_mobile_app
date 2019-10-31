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

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<AuthUser> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$connectInstitutionAsyncAction = AsyncAction('connectInstitution');

  @override
  Future connectInstitution(BuildContext context) {
    return _$connectInstitutionAsyncAction
        .run(() => super.connectInstitution(context));
  }
}
