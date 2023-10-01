import 'package:wcars/app/utils/ui_helper.dart';
import 'package:wcars/domain/entities/user/auth_entity.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/utils/resource_data.dart';
import '../../../domain/utils/status.dart';
import '../../helpers/error_mapper.dart';
import '../../local/shared_preferences.dart';
import '../../remote/custom_dio.dart';

@injectable
class AuthRemoteDataSource {
  final CustomDio _dio;
  AuthRemoteDataSource(this._dio);

  Future<ResourceData<AuthEntity>> login(dynamic credential) async {
    try {
      final usuario = credential['usuario'];
      final senha = credential['senha'];

      final result = await _dio.post('/auth/login', data: {
        'login': usuario,
        'pass': senha,
      });

      return ResourceData(
          status: Status.success, data: AuthEntity.fromMap(result));
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }
}
