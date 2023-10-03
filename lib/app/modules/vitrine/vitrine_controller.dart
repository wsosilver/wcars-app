import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/entities/carro/config_list_carros.dart';
import 'package:wcars/domain/usecases/carro/get_list_carros.use_case.dart';

import '../../../../di/di.dart';

import '../../../../domain/utils/status.dart';
import '../../../domain/utils/resource_data.dart';

part 'vitrine_controller.g.dart';

@Injectable()
class VitrineController = VitrineControllerBase with _$VitrineController;

abstract class VitrineControllerBase with Store {
  final _getCarros = getIt.get<GetListCarrosUseCase>();
  @observable
  ResourceData<ConfigList?>? config;

  ini() {
    getListCarros(1);
  }

  @observable
  ResourceData<ConfigList> carros = const ResourceData(status: Status.initial);

  @observable
  List<CarroEntity> listCarrosAux = [];

  filterCarros(String search) {
    listCarrosAux = carros.data!.carros
        .where((carro) =>
            carro.nome.toLowerCase().contains(search.toLowerCase()) ||
            carro.marca.contains(search.toLowerCase()) ||
            carro.modelo.contains(search.toLowerCase()))
        .toList();
  }

  @action
  getListPaginacao(int page) async {
    config = await _getCarros(page);
    if (config!.status == Status.success) {
      config!.data!.carros.map((e) => carros.data!.carros.add(e));
      // config!.data!.carros.map((e) => listCarrosAux.add(e));
      for (var i = 0; i < config!.data!.carros.length; i++) {
        listCarrosAux.add(config!.data!.carros[i]);
      }
    }
  }

  @action
  getListCarros(int page) async {
    carros = const ResourceData(status: Status.loading);
    carros = await _getCarros(page);
    if (carros.status == Status.success) {
      listCarrosAux = carros.data!.carros;
      config = carros;
    }
  }
}
