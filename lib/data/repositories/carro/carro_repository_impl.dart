import 'package:wcars/data/data_source/carro/carro_remote_data_source.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/utils/resource_data.dart';
import '../../../domain/repositories/carro/carro_repository.dart';

class CarroRepositoryImpl implements CarroRepository {
  CarroRemoteDataSource carroRemoteDataSource;

  CarroRepositoryImpl(this.carroRemoteDataSource);

  @override
  Future<ResourceData<List<CarroEntity>>> getListCarros(int page) async {
    final resource = await carroRemoteDataSource.getListCarros(page);
    return resource;
  }

  @override
  Future<ResourceData> adicionar(CarroEntity carro) async {
    final resource = await carroRemoteDataSource.adicionar(carro);
    return resource;
  }
}
