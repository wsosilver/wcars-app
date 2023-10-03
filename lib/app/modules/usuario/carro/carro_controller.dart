import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/usecases/carro/alterar_carro.use_case%20copy.dart';
import 'package:wcars/domain/usecases/carro/excluir_carro.use_case%20copy.dart';
import '../../../../di/di.dart';
import '../../../../domain/usecases/carro/adicionar_carro.use_case.dart';
import '../../../../domain/utils/resource_data.dart';
import '../../../../domain/utils/status.dart';

part 'carro_controller.g.dart';

@Injectable()
class CarroController = CarroControllerBase with _$CarroController;

abstract class CarroControllerBase with Store {
  final _adicionarCarro = getIt.get<AdcionarCarroUseCase>();
  final _alterarCarro = getIt.get<AlterarCarroUseCase>();
  final _excluirCarro = getIt.get<ExcluirCarroUseCase>();

  @observable
  ResourceData statusAdicionar = const ResourceData(status: Status.initial);

  @observable
  ResourceData statusExcluir = const ResourceData(status: Status.initial);

  @action
  Future<ResourceData> adicionar(CarroEntity carro) async {
    statusAdicionar = const ResourceData(status: Status.loading);
    statusAdicionar = await _adicionarCarro(carro);
    return statusAdicionar;
  }

  Future salvar(CarroEntity carro) async {
    await alterar(carro);
    return;
  }

  @action
  Future<ResourceData> alterar(CarroEntity carro) async {
    statusAdicionar = const ResourceData(status: Status.loading);
    statusAdicionar = await _alterarCarro(carro);
    return statusAdicionar;
  }

  @action
  Future<ResourceData> excluir(int id) async {
    statusExcluir = const ResourceData(status: Status.loading);
    statusExcluir = await _excluirCarro(id);
    return statusExcluir;
  }
}
