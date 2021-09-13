import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/currency/currency.module.dart';
import 'modules/dashboard/dashboard.module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CurrencyModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: DashboardModule(), transition: TransitionType.fadeIn),
  ];
}
