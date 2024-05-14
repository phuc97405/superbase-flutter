import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/core/common/result.dart';
import 'package:superbase_flutter/data/models/payload/create_user_payload.dart';
import 'package:superbase_flutter/data/models/response/create_user_response.dart';
import 'package:superbase_flutter/domain/repositories/auth_repository_impl.dart';

@injectable
class CreateUserUseCase {
  final AuthRepository authRepository;

  CreateUserUseCase(this.authRepository);

  Future<Result<CreateUserResponse?>> call(CreateUserPayload payload) async =>
      await authRepository.createUser(payload);

  Future<String?> userMapper(CreateUserPayload payload) async {
    final res = await authRepository.createUser(payload);
    return res.when(success: (data, _) => data?.user?.name ?? 'hello');
  }
}

// mixin CreateUserMapper on CreateUserUseCase {
//   String userMapper(CreateUserResponse user) {
//     return user.user?.name ?? 'hello';
//   }
// }
