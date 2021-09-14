import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../currency/presenter/stores/currency.store.dart';

part 'dashboard.store.g.dart';

class DashboardStore = _DashboardStore with _$DashboardStore;

abstract class _DashboardStore with Store {
  final currencyStore = Modular.get<CurrencyStore>();
  final dio = Dio();

  @observable
  String currentRoute = '/dashboard/home';

  @observable
  double freightCost = 0.0;

  @action
  void setRoute(String route) => currentRoute = route;

  @action
  Future<void> refreshDashboard() async {
    await currencyStore.refresh();
  }

  @action
  Future<void> getFreightcost() async {
    try {
      final response = await dio.post(
        'http://54.165.230.28:8000/api/currency/cost',
        data: {
          "Calendar Year/Month": "segunda-feira, 1 de outubro de 2018",
          "Delivery Item": 10,
          "Material": "BART/000000000050377401",
          "Material Name": "EUPERLAN BRIGHT 200KG 1H2",
          "OD": "EM",
          "BU": "EMY",
          "SBU": "EMB",
          "Special Processing Indicator": 1200,
          "Carrier": "LOURENCO TRANSPORTE E COMERCIO LTDA",
          "Plant": "6BBC",
          "Plant Name": "BASF S.A - Jacareí",
          "Depshipping point": "BRC1",
          "Depshipping point name": "SP - Jacarei",
          "SH - Ship-To Party": "APA/1084500",
          "SH - Ship-To Party name": "PROVIDER IND E COM SA",
          "City": "LOUVEIRA",
          "Postal Code": "BR/13290-000",
          "Region": "BR/SP",
          "Transportation zone": "BRASP09",
          "Pack Materials Tr": "TRUCK -6 TO",
          "Inco 1 (shipment)": "CIP",
          "Country TO": "Brazil",
          "Gosss Delivery Wt-KG": 209.4,
          "OD Special": "EM",
          "Cidade Origem": "BASF S.A - Jacareí",
          "CPRE": "FTL",
          "Estado": "SP",
          "Transfer/EndCustomer": "End Customer",
          "Cidade/Estado": "LOUVEIRA/SP"
        },
      );
      freightCost = response.data['score'];
    } on Exception catch (e) {
      print(e);
    }
  }
}
