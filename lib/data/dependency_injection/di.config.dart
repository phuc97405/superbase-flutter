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

import '../../domain/repositories/auth_repository_impl.dart' as _i5;
import '../../domain/usecases/create_user_usecase.dart' as _i6;
import '../remote/auth_service.dart' as _i3;

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
  gh.factory<_i3.AuthService>(() => _i3.AuthService(gh<_i4.Dio>()));
  gh.factory<_i5.AuthRepository>(
      () => _i5.AuthRepositoryImpl(gh<_i3.AuthService>()));
  gh.factory<_i6.CreateUserUseCase>(
      () => _i6.CreateUserUseCase(gh<_i5.AuthRepository>()));
  return getIt;
}
