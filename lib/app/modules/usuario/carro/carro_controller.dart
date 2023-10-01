import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/domain/entities/carro/carro_entity.dart';
import 'package:wcars/domain/entities/user/auth_entity.dart';

import '../../../../di/di.dart';

import '../../../../domain/utils/status.dart';

part 'carro_controller.g.dart';

@Injectable()
class CarroController = CarroControllerBase with _$CarroController;

abstract class CarroControllerBase with Store {
  // final _login = getIt.get<LoginUseCase>();

  // @observable
  // ResourceData<AuthEntity> statusLogin =
  //     const ResourceData(status: Status.initial);

  // @observable
  // List<CarroEntity> listCarrosAux = [];

  // @action
  // Future<ResourceData<AuthEntity>> login(String usuario, String senha) async {
  //   statusLogin = const ResourceData(status: Status.loading);
  //   statusLogin = await _login({"usuario": usuario, "senha": senha});
  //   return statusLogin;
  // }
}
