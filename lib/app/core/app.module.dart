import 'package:flutter_modular/flutter_modular.dart';

import '../modules/dashboard/dashboard.module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: DashboardModule(), transition: TransitionType.fadeIn),
  ];
}
