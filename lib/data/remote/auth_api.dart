import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:superbase_flutter/core/networking/model_base_response.dart';
import 'package:superbase_flutter/data/models/payload/create_user_payload.dart';
import 'package:superbase_flutter/data/models/response/create_user_response.dart';
part 'auth_api.g.dart';

class AuthApiConstants {
  static const createUser = 'user/create-user';
}

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(AuthApiConstants.createUser)
  Future<ModelBaseResponse<CreateUserResponse?>> createUser(
      @Body() CreateUserPayload payload);
  // void createUser();
}
