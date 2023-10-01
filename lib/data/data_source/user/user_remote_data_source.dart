import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wcars/domain/entities/user/user_entity.dart';
import '../../../domain/utils/resource_data.dart';
import '../../../domain/utils/status.dart';
import '../../helpers/error_mapper.dart';
import '../../remote/custom_dio.dart';

@injectable
class UserRemoteDataSource {
  final CustomDio _dio;
  UserRemoteDataSource(this._dio);

  Future<ResourceData<UsuarioEntity>> login(dynamic credential) async {
    try {
      final doc = credential['username'].replaceAll(RegExp(r'[^\w\s]+'), '');
      final pass = credential['password'];
      final result = await _dio
          .post('auth/login', data: {'username': doc, 'password': pass});
      return ResourceData(status: Status.success, data: result);
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }
}
