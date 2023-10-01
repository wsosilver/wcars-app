import 'package:wcars/data/data_source/carro/carro_remote_data_source.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';

import '../../utils/resource_data.dart';

abstract class CarroRepository {
  Future<ResourceData<List<CarroEntity>>> getListCarros(int page);
}
