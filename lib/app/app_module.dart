import 'package:flutter_modular/flutter_modular.dart';
import 'package:wcars/app/constants/route_name.dart';
import 'package:wcars/app/modules/vitrine/vitrine_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(RouteName.splash, module: SplashModule()),
        ModuleRoute(RouteName.vitrine, module: VitrineModule()),
      ];
}
