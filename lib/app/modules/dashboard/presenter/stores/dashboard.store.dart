import 'package:mobx/mobx.dart';

part 'dashboard.store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  @observable
  String currentRoute = '/dashboard/home';

  @action
  void setRoute(String route) => currentRoute = route;
}
