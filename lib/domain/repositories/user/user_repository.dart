import '../../../data/data_source/user/user_remote_data_source.dart';
import '../../utils/resource_data.dart';

abstract class UserRepository {
  UserRepository(UserRemoteDataSource userRemoteDataSource);

  // Future<ResourceData<int?>> checkUser(String cpfCnpj);
  // Future<ResourceData<AuthEntity>> login(dynamic credential);
  // Future<ResourceData<UserEntity?>> getUser(String cpfCnpj);
  // Future<ResourceData<List<EmailEntity>?>> getEmails(String cpfCnpj);
  // Future<ResourceData> sendToken(dynamic params);
  // Future<ResourceData> sendFcmToken(dynamic params);
  Future<ResourceData> alterarSenha(dynamic params);
}
