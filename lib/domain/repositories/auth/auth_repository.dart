import 'package:wcars/data/data_source/auth/auth_remote_data_source.dart';
import 'package:wcars/domain/entities/user/auth_entity.dart';

import '../../utils/resource_data.dart';

abstract class AuthRepository {
  AuthRepository(AuthRemoteDataSource authRemoteDataSource);
  Future<ResourceData<AuthEntity>> login(dynamic credential);
}
