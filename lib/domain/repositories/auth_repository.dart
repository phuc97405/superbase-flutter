import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/core/networking/model_base_response.dart';
import 'package:superbase_flutter/data/models/payload/create_user_payload.dart';
import 'package:superbase_flutter/data/models/response/create_user_response.dart';
import 'package:superbase_flutter/data/remote/auth_api.dart';

abstract class AuthRepository {
  Future<ModelBaseResponse<CreateUserResponse?>> createUser(
      CreateUserPayload payload);
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<ModelBaseResponse<CreateUserResponse?>> createUser(
      CreateUserPayload payload) async {
    return await _authApi.createUser(payload);
  }
}
