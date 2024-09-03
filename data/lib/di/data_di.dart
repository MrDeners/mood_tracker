import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../providers/firebase_auth_provider.dart';
import '../providers/firebase_db_provider.dart';
import '../repositories/auth/auth_repository_impl.dart';
import '../repositories/auth/user_data_repository_impl.dart';
import '../repositories/db_repository_impl.dart';
import '../repositories/tip_service_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initAuthenticationDependencies();
    _initUserDataDependencies();
    _initTipServiceDependencies();
    _initDbServiceDependencies();
  }

  void _initAuthenticationDependencies() {
    appLocator.registerLazySingleton<FirebaseAuthProvider>(FirebaseAuthProvider.new);

    appLocator.registerLazySingleton<AuthRepository>(
      () {
        return AuthRepositoryImpl(
          authApiProvider: appLocator<FirebaseAuthProvider>(),
        );
      },
    );

    appLocator.registerLazySingleton<SignUpUseCase>(
      () {
        return SignUpUseCase(
          authRepository: appLocator<AuthRepository>(),
        );
      },
    );

    appLocator.registerLazySingleton<SignInUseCase>(
      () {
        return SignInUseCase(
          authRepository: appLocator<AuthRepository>(),
        );
      },
    );
  }

  void _initUserDataDependencies() {
    appLocator.registerLazySingleton<UserDataRepository>(
      UserDataRepositoryImpl.new,
    );

    appLocator.registerLazySingleton<SessionCheckUseCase>(
      () {
        return SessionCheckUseCase(
          userDataRepository: appLocator<UserDataRepository>(),
        );
      },
    );

    appLocator.registerLazySingleton<GetUserDataUseCase>(
      () {
        return GetUserDataUseCase(
          userDataRepository: appLocator<UserDataRepository>(),
        );
      },
    );
  }

  void _initTipServiceDependencies() {
    appLocator.registerLazySingleton<TipServiceRepository>(
      TipServiceRepositoryImpl.new,
    );

    appLocator.registerLazySingleton<CreateTipUseCase>(
      () {
        return CreateTipUseCase(
          tipServiceRepository: appLocator<TipServiceRepository>(),
        );
      },
    );
  }

  void _initDbServiceDependencies() {
    appLocator.registerLazySingleton<FirebaseDbProvider>(FirebaseDbProvider.new);

    appLocator.registerLazySingleton<DbRepository>(() {
      return DbRepositoryImpl(
        dbProvider: appLocator<FirebaseDbProvider>(),
      );
    });

    appLocator.registerLazySingleton<WriteNoteToDbUseCase>(
      () {
        return WriteNoteToDbUseCase(
          dbRepository: appLocator<DbRepository>(),
        );
      },
    );
  }
}
