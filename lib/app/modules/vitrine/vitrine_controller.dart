import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/usecases/carro/get_list_carros.use_case.dart';

import '../../../../di/di.dart';

import '../../../../domain/utils/status.dart';
import '../../../domain/utils/resource_data.dart';

part 'vitrine_controller.g.dart';

@Injectable()
class VitrineController = VitrineControllerBase with _$VitrineController;

abstract class VitrineControllerBase with Store {
  final _getCarros = getIt.get<GetListCarrosUseCase>();

  ini() {
    getListCarros(1);
  }

  @observable
  ResourceData<List<CarroEntity>> carros =
      const ResourceData(status: Status.initial, data: []);

  @observable
  List<CarroEntity> listCarrosAux = [];

  filterCarros(String search) {
    listCarrosAux = carros.data!
        .where((carro) =>
            carro.nome.toLowerCase().contains(search.toLowerCase()) ||
            carro.marca.contains(search.toLowerCase()) ||
            carro.modelo.contains(search.toLowerCase()))
        .toList();
  }

  @action
  getListCarros(int page) async {
    carros = const ResourceData(status: Status.loading, data: []);
    carros = await _getCarros(page);
    if (carros.status == Status.success) {
      listCarrosAux = carros.data!;
    }
  }
}
