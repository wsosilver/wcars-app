import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/app/modules/usuario/auth/login_page.dart';
import 'package:wcars/app/modules/usuario/carro/carro_page.dart';
import 'package:wcars/app/modules/usuario/home/home_page.dart';

class UsuarioModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ChildRoute('/carro',
        child: (_, args) => CarroPage(
              carro: args.data,
            )),
  ];
}
