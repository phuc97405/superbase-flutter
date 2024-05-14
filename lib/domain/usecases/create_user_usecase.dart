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
}
