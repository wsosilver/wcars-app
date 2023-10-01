import 'package:wcars/domain/entities/user/auth_entity.dart';
import 'package:injectable/injectable.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../utils/resource_data.dart';
import '../base/base_future_use_case.dart';

@injectable
class LoginUseCase
    extends BaseFutureUseCase<dynamic, ResourceData<AuthEntity>> {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<ResourceData<AuthEntity>> call([dynamic params]) {
    return authRepository.login(params);
  }
}
