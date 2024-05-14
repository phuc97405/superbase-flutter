import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/core/common/result.dart';
import 'package:superbase_flutter/data/models/payload/check_user_payload.dart';
import 'package:superbase_flutter/data/models/response/create_user_response.dart';
import 'package:superbase_flutter/domain/repositories/auth_repository_impl.dart';

@injectable
class CheckUserUseCase {
  final AuthRepository authRepository;

  CheckUserUseCase(this.authRepository);

  Future<Result<CreateUserResponse?>> call(CheckUserPayload payload) async =>
      await authRepository.checkUserLogin(payload);
}
