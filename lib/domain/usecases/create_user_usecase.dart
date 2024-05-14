import 'package:injectable/injectable.dart';
import 'package:superbase_flutter/data/models/payload/create_user_payload.dart';
import 'package:superbase_flutter/domain/repositories/auth_repository.dart';

@injectable
class CreateUserUseCase {
  final AuthRepository authRepository;

  CreateUserUseCase(this.authRepository);

  Future<void> call(CreateUserPayload payload) async =>
      await authRepository.createUser(payload);
}
