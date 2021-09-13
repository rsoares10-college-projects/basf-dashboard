import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../currency/presenter/stores/currency.store.dart';

part 'dashboard.store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  final currencyStore = Modular.get<CurrencyStore>();

  @observable
  String currentRoute = '/dashboard/home';

  @action
  void setRoute(String route) => currentRoute = route;

  @action
  Future<void> refreshDashboard() async {
    await currencyStore.refresh();
  }
}
