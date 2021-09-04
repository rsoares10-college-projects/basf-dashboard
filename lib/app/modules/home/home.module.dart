import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/views/home.view.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => <ModularRoute<dynamic>>[
        ChildRoute('/', child: (__, _) => HomeView(), transition: TransitionType.fadeIn),
      ];
}
