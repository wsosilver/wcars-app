import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/entities/carro/config_list_carros.dart';
import 'package:wcars/domain/usecases/carro/get_list_carros.use_case.dart';

import '../../../../di/di.dart';

import '../../../../domain/utils/resource_data.dart';
import '../../../../domain/utils/status.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final _getCarros = getIt.get<GetListCarrosUseCase>();

  ini() {
    getListCarros(null);
  }

  @observable
  ResourceData<ConfigList> carros = const ResourceData(status: Status.initial);

  @observable
  List<CarroEntity> listCarrosAux = [];

  @observable
  ConfigList? config;

  filterCarros(String search) {
    listCarrosAux = carros.data!.carros
        .where((carro) =>
            carro.nome.toLowerCase().contains(search.toLowerCase()) ||
            carro.marca.contains(search.toLowerCase()) ||
            carro.modelo.contains(search.toLowerCase()))
        .toList();
  }

  @action
  getListCarros(int? page) async {
    carros = const ResourceData(status: Status.loading);
    carros = await _getCarros(page);
    if (carros.status == Status.success) {
      listCarrosAux = carros.data!.carros;
    }
  }
}
