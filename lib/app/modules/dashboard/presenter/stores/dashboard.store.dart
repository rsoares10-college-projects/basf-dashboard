import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
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

  @action
  void setRoute(String route) => currentRoute = route;

  @observable
  double freightCost = 0.0;

  @action
  Future<void> refreshDashboard() async {
    await currencyStore.refresh();
  }

  @observable
  List<String>? materialNameList;

  @observable
  List<String>? carrierNameList;

  @observable
  List<String>? sbuList;

  @observable
  List<String>? plantNameList;

  @observable
  List<String>? depshippingPointNameList;

  @observable
  List<String>? shShipToPartyNameList;

  @observable
  List<String>? regionNameList;

  @observable
  List<String>? transportationZoneList;

  @observable
  List<String>? packMaterialsTrNameList;

  @observable
  List<String>? inco1ShipmentList;

  @observable
  List<String>? cpreList;

  @observable
  List<String>? stateNameList;

  @observable
  List<String>? transferEndCustomerTypeList;

  @observable
  int? deliveryItem;

  @observable
  String? materialName;

  @observable
  String? sBU;

  @observable
  int? specialProcessingIndicator;

  @observable
  String? carrier;

  @observable
  String? plantName;

  @observable
  String? depshippingPointName;

  @observable
  String? sHShipToPartyName;

  @observable
  String? region;

  @observable
  String? transportationZone;

  @observable
  String? packMaterialsTr;

  @observable
  String? inco1Shipment;

  @observable
  double? gDWKg;

  @observable
  String? cPRE;

  @observable
  String? estado;

  @observable
  String? transferEndCustomer;

  @observable
  double? dieselS10;

  @observable
  double? dolarCompra;

  @observable
  double? dolarVenda;

  @observable
  double? euroCompra;

  @observable
  double? euroVenda;

  @observable
  int? radioGroupValue = 0;

  @action
  void onRadioChane(int? value) {
    radioGroupValue = value;
    transferEndCustomer = transferEndCustomerTypeList?[value!];
  }

  printData() {
    print('**Current data being sent');
    print('materialName: $materialName');
    print('Delivery Item: $deliveryItem');
    print('sBU: $sBU');
    print('specialProcessingIndicator: $specialProcessingIndicator');
    print('carrier: $carrier');
    print('plantName: $plantName');
    print('depshippingPointName: $depshippingPointName');
    print('sHShipToPartyName: $sHShipToPartyName');
    print('region: $region');
    print('transportationZone: $transportationZone');
    print('packMaterialsTr: $packMaterialsTr');
    print('inco1Shipment: $inco1Shipment');
    print('gDWKg: $gDWKg');
    print('cPRE: $cPRE');
    print('estado: $estado');
    print('transferEndCustomer: $transferEndCustomer');
    print('dieselS10: $dieselS10');
    print('dolarCompra: $dolarCompra');
    print('dolarVenda: $dolarVenda');
    print('euroCompra: $euroCompra');
    print('euroVenda: $euroVenda');
  }

  @action
  Future<void> loadLocalBASFData() async {
    final response = await rootBundle.loadString('assets/json_files/exp_features.json');
    final data = await json.decode(response);

    materialNameList = List<String>.from(data['Material Name']);
    carrierNameList = List<String>.from(data['Carrier']);
    sbuList = List<String>.from(data['SBU']);
    plantNameList = List<String>.from(data['Plant Name']);
    depshippingPointNameList = List<String>.from(data['Depshipping point name']);
    shShipToPartyNameList = List<String>.from(data['SH - Ship-To Party name']);
    regionNameList = List<String>.from(data['Region']);
    transportationZoneList = List<String>.from(data['Transportation zone']);
    packMaterialsTrNameList = List<String>.from(data['Pack Materials Tr']);
    inco1ShipmentList = List<String>.from(data['Inco 1 (shipment)']);
    cpreList = List<String>.from(data['CPRE']);
    stateNameList = List<String>.from(data['Estado']);
    transferEndCustomerTypeList = List<String>.from(data['Transfer/EndCustomer']);

    transferEndCustomer = transferEndCustomerTypeList?[0];
    materialName = materialNameList?[0];
    sBU = sbuList?[0];
    carrier = carrierNameList?[0];
    transportationZone = transportationZoneList?[0];
    plantName = plantNameList?[0];
    region = regionNameList?[0];
    estado = stateNameList?[0];
    packMaterialsTr = packMaterialsTrNameList?[0];
    inco1Shipment = inco1ShipmentList?[0];
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
