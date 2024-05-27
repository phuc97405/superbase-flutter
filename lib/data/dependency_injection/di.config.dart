// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/repositories/auth_repository_impl.dart' as _i6;
import '../../domain/usecases/check_user_usecase.dart' as _i8;
import '../../domain/usecases/create_user_usecase.dart' as _i7;
import '../local/auth_cache_manager.dart' as _i3;
import '../remote/auth_service.dart' as _i5;
import 'modules/datasource.module.dart' as _i9;

const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataSourceModule = _$DataSourceModule();
  gh.singleton<_i3.AuthCacheManager>(() => _i3.AuthCacheManager());
  gh.singleton<_i4.Dio>(
    () => dataSourceModule.dioProd(),
    registerFor: {_dev},
  );
  gh.factory<_i5.AuthService>(() => _i5.AuthService(gh<_i4.Dio>()));
  gh.factory<_i6.AuthRepository>(
      () => _i6.AuthRepositoryImpl(gh<_i5.AuthService>()));
  gh.factory<_i7.CreateUserUseCase>(
      () => _i7.CreateUserUseCase(gh<_i6.AuthRepository>()));
  gh.factory<_i8.CheckUserUseCase>(
      () => _i8.CheckUserUseCase(gh<_i6.AuthRepository>()));
  return getIt;
}

class _$DataSourceModule extends _i9.DataSourceModule {}
