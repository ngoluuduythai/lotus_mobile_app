import 'package:get_it/get_it.dart';
import 'package:main/services/graphql.service.dart';
import 'package:main/services/facebook.service.dart';
import 'package:main/services/plaid.service.dart';
import 'package:main/store/auth_user/auth_user.store.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //services
  locator.registerLazySingleton(() => GraphqlService());
  locator.registerLazySingleton(() => FacebookService());
  locator.registerLazySingleton(() => PlaidService());
  //stores
  locator.registerLazySingleton(() => AuthUserStore());
}