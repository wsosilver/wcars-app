import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/entities/carro/config_list_carros.dart';
import '../../../domain/utils/resource_data.dart';
import '../../../domain/utils/status.dart';
import '../../helpers/error_mapper.dart';
import '../../remote/custom_dio.dart';

@injectable
class CarroRemoteDataSource {
  final CustomDio _dio;
  CarroRemoteDataSource(this._dio);

  Future<ResourceData<ConfigList>> getListCarros(int? page) async {
    try {
      final result = await _dio.get('carros?page=$page');
      return ResourceData(
          status: Status.success, data: ConfigList.fromJson(result));
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> adicionar(CarroEntity carro) async {
    try {
      var formData = FormData.fromMap({
        "nome": carro.nome,
        "marca": carro.marca,
        "modelo": carro.modelo,
        "preco": carro.preco,
        "file": carro.foto != null
            ? await MultipartFile.fromFile(carro.foto!)
            : null
      });
      await _dio.post('carros', data: formData);
      return ResourceData(status: Status.success);
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> alterar(CarroEntity carro) async {
    try {
      var formData = FormData.fromMap({
        "nome": carro.nome,
        "marca": carro.marca,
        "modelo": carro.modelo,
        "preco": carro.preco,
        "file": carro.foto != null
            ? await MultipartFile.fromFile(carro.foto!)
            : null
      });
      await _dio.post('carros/alterar/${carro.id}', data: formData);
      return ResourceData(status: Status.success);
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }

  Future<ResourceData> excluir(int id) async {
    try {
      await _dio.delete('carros/$id');
      return ResourceData(status: Status.success);
    } on DioException catch (e) {
      return ResourceData(
          status: Status.failed, data: null, error: ErrorMapper.from(e));
    }
  }
}
