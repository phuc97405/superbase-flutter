import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/core/common/result.dart';
import 'package:superbase_flutter/data/models/base_repository.dart';
import 'package:superbase_flutter/data/models/payload/check_user_payload.dart';
import 'package:superbase_flutter/data/models/payload/create_user_payload.dart';
import 'package:superbase_flutter/data/models/response/create_user_response.dart';
import 'package:superbase_flutter/data/remote/auth_service.dart';

abstract class AuthRepository {
  Future<Result<CreateUserResponse?>> checkUserLogin(CheckUserPayload payload);
  Future<Result<CreateUserResponse?>> createUser(CreateUserPayload payload);
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<Result<CreateUserResponse?>> createUser(CreateUserPayload payload) =>
      baseApiRepository(_authService.createUser(payload));

  @override
  Future<Result<CreateUserResponse?>> checkUserLogin(
          CheckUserPayload payload) =>
      baseApiRepository(_authService.checkUserSocial(payload));
}
