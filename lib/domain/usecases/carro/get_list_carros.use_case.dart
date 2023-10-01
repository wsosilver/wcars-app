import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:wcars/domain/repositories/carro/carro_repository.dart';
import '../../utils/resource_data.dart';
import '../base/base_future_use_case.dart';

@injectable
class GetListCarrosUseCase
    extends BaseFutureUseCase<int, ResourceData<List<CarroEntity>>> {
  CarroRepository carroRepository;

  GetListCarrosUseCase(this.carroRepository);

  @override
  Future<ResourceData<List<CarroEntity>>> call([int? params]) {
    return carroRepository.getListCarros(params!);
  }
}
