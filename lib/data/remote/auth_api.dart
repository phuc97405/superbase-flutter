import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

class AuthApiConstants {
  static const createUser = 'user/create-user';
}

@RestApi()
@injectable
abstract class AuthApi {
  @factoryMethod
  // factory AuthApi(Dio dio) = _AuthApi;

  // @POST(AuthApiConstants.createUser)
  // Future<ModelBaseResponse<CreateUserResponse?>> createUser(
  //     @Body() CreateUserPayload payload);
  void createUser();
}
