import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import '../../../domain/utils/resource_data.dart';
import '../../../domain/utils/status.dart';
import '../../helpers/error_mapper.dart';
import '../../remote/custom_dio.dart';

@injectable
class CarroRemoteDataSource {
  final CustomDio _dio;
  CarroRemoteDataSource(this._dio);

  Future<ResourceData<List<CarroEntity>>> getListCarros(int page) async {
    try {
      final result = await _dio.get('carros?page=$page');
      return ResourceData(
          status: Status.success,
          data: CarroEntity.fromMapList(result['data']));
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }
}
