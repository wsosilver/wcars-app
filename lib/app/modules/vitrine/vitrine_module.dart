import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/app/modules/vitrine/vitrine_page.dart';

class VitrineModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const VitrinePage()),
  ];
}
