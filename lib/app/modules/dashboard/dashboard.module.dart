import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/dashboard-layout.view.dart';

class DashboardModule extends Module {
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (__, _) => DashboardLayout(), transition: TransitionType.fadeIn),
  ];
}
