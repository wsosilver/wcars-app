import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import '../../../../di/di.dart';
import '../../../../domain/usecases/carro/adicionar_carro.use_case.dart';
import '../../../../domain/utils/resource_data.dart';
import '../../../../domain/utils/status.dart';

part 'carro_controller.g.dart';

@Injectable()
class CarroController = CarroControllerBase with _$CarroController;

abstract class CarroControllerBase with Store {
  final _adicionarCarro = getIt.get<AdcionarCarroUseCase>();

  @observable
  ResourceData statusAdicionar = const ResourceData(status: Status.initial);

  @action
  Future<ResourceData> adicionar(CarroEntity carro) async {
    statusAdicionar = const ResourceData(status: Status.loading);
    statusAdicionar = await _adicionarCarro(carro);
    return statusAdicionar;
  }

  salvar(CarroEntity carro) {
    carro.id != null ? alterar(carro) : adicionar(carro);
  }

  @action
  Future<ResourceData> alterar(CarroEntity carro) async {
    statusAdicionar = const ResourceData(status: Status.loading);
    print(carro);
    // statusAdicionar = await _adicionarCarro(carro);
    return statusAdicionar;
  }
}
