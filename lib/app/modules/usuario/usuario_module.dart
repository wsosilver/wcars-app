import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/app/modules/usuario/login_page.dart';

class UsuarioModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
