import 'package:basf_dashboard/app/modules/dashboard/presenter/stores/dashboard.store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/views/splash.view.dart';
import '../home/home.module.dart';
import 'presenter/views/about.view.dart';
import 'presenter/views/analytics.view.dart';
import 'presenter/views/currency.view.dart';
import 'presenter/views/dashboard-layout.view.dart';
import 'presenter/views/social.view.dart';

class DashboardModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => DashboardStore()),
      ];

  final List<ModularRoute> routes = [
    ChildRoute('/', child: (__, _) => SplashView(), transition: TransitionType.fadeIn),
    ChildRoute(
      '/dashboard',
      child: (context, args) => DashboardLayout(),
      children: <ModularRoute<dynamic>>[
        ModuleRoute('/home', module: HomeModule(), transition: TransitionType.fadeIn),
        ChildRoute('/currency', child: (__, _) => Currencyview(), transition: TransitionType.fadeIn),
        ChildRoute('/social', child: (__, _) => SocialView(), transition: TransitionType.fadeIn),
        ChildRoute('/analytics', child: (__, _) => AnalyticsView(), transition: TransitionType.fadeIn),
        ChildRoute('/about', child: (__, _) => AboutView(), transition: TransitionType.fadeIn),
      ],
      transition: TransitionType.fadeIn,
    ),
  ];
}
