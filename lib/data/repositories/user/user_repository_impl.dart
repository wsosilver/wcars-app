import '../../../domain/repositories/user/user_repository.dart';
import '../../../domain/utils/resource_data.dart';
import '../../data_source/user/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<ResourceData> alterarSenha(params) {
    // TODO: implement alterarSenha
    throw UnimplementedError();
  }
}
