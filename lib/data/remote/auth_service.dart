import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:superbase_flutter/core/networking/model_base_response.dart';
import 'package:superbase_flutter/data/models/payload/check_user_payload.dart';
import 'package:superbase_flutter/data/models/payload/create_user_payload.dart';
import 'package:superbase_flutter/data/models/response/create_user_response.dart';
part 'auth_service.g.dart';

class AuthServiceConstants {
  static const checkUserSocial = 'user/check-user-social';
  static const createUser = 'user/create-user';
}

@RestApi()
@injectable
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST(AuthServiceConstants.checkUserSocial)
  Future<ModelBaseResponse<CreateUserResponse?>> checkUserSocial(
      @Body() CheckUserPayload payload);

  @POST(AuthServiceConstants.createUser)
  Future<ModelBaseResponse<CreateUserResponse?>> createUser(
      @Body() CreateUserPayload payload);
}
