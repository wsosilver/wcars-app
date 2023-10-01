import 'package:wcars/domain/entities/user/auth_entity.dart';
import 'package:wcars/domain/repositories/auth/auth_repository.dart';

import 'package:wcars/domain/utils/resource_data.dart';

import '../../../domain/utils/status.dart';
import '../../data_source/auth/auth_local_data_source.dart';
import '../../data_source/auth/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthLocalDataSource authLocalDataSource;
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authLocalDataSource, this.authRemoteDataSource);

  @override
  Future<ResourceData<AuthEntity>> login(credential) async {
    final resource = await authRemoteDataSource.login(credential);
    if (resource.status == Status.success) {
      authLocalDataSource.saveToken(resource.data?.token ?? '');
    }
    return resource;
  }
}
