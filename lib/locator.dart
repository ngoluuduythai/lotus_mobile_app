import 'package:get_it/get_it.dart';
import 'package:main/shared/services/employer.service.dart';
import 'package:main/shared/services/linkedin.service.dart';
import 'package:main/shared/services/user.service.dart';
import './shared/constants/env.dart';
import 'shared/services/facebook.service.dart';
import 'shared/services/google.service.dart';
import 'shared/services/graphql.service.dart';
import 'shared/services/financial.service.dart';
import 'shared/store/auth_user/auth_user.store.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //services
  locator.registerLazySingleton(
      () => GraphqlService(graphqlUrl: ENV.graphqlApiUrl));
  locator.registerLazySingleton(() => FacebookService());
  locator.registerLazySingleton(() => GoogleService());
  locator.registerLazySingleton(() => LinkedinService());
  locator.registerLazySingleton(() => FinancialService());
  locator.registerLazySingleton(() => UserService());
  locator.registerLazySingleton(() => EmployerService());
  //stores
  locator.registerLazySingleton(() => AuthUserStore());
}
