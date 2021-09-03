import 'package:flutter_modular/flutter_modular.dart';

import '../../core/views/splash.view.dart';
import '../home/home.module.dart';
import 'presenter/views/about.view.dart';
import 'presenter/views/analytics.view.dart';
import 'presenter/views/dashboard-layout.view.dart';
import 'presenter/views/simulator.view.dart';

class DashboardModule extends Module {
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (__, _) => SplashView(), transition: TransitionType.fadeIn),
    ChildRoute(
      '/dashboard',
      child: (context, args) => DashboardLayout(),
      children: <ModularRoute<dynamic>>[
        ModuleRoute('/home', module: HomeModule(), transition: TransitionType.fadeIn),
        ChildRoute('/simulator', child: (__, _) => SimulatorView(), transition: TransitionType.fadeIn),
        ChildRoute('/analytics', child: (__, _) => AnalyticsView(), transition: TransitionType.fadeIn),
        ChildRoute('/about', child: (__, _) => AboutView(), transition: TransitionType.fadeIn),
      ],
      transition: TransitionType.fadeIn,
    ),
  ];
}
