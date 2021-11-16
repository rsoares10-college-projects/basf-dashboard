import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../currency/presenter/stores/currency.store.dart';
import '../../../home/models/predict.model.dart';

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
  double? freightCost = 0.0;

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
  int? deliveryItem = 1;

  @observable
  String? materialName;

  @observable
  String? sBU;

  @observable
  int? specialProcessingIndicator = 1;

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
  double? gDWKg = 0.0;

  @observable
  String? cPRE;

  @observable
  String? estado;

  @observable
  String? transferEndCustomer;

  @observable
  double? dieselS10 = 0.0;

  @observable
  double? dolarCompra = 0.0;

  @observable
  double? dolarVenda = 0.0;

  @observable
  double? euroCompra = 0.0;

  @observable
  double? euroVenda = 0.0;

  @observable
  int? radioGroupValue = 0;

  @action
  void onRadioChane(int? value) {
    radioGroupValue = value;
    transferEndCustomer = transferEndCustomerTypeList?[value!];
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
    freightCost = null;

    final predictModel = PredictModel(
      materialName: materialName,
      dolarVenda: dolarVenda,
      gDWKg: gDWKg,
      cPRE: cPRE,
      specialProcessingIndicator: specialProcessingIndicator,
      carrier: carrier,
      deliveryItem: deliveryItem,
      depshippingPointName: depshippingPointName,
      dieselS10: dieselS10,
      dolarCompra: dolarCompra,
      estado: estado,
      euroCompra: euroCompra,
      euroVenda: euroVenda,
      inco1Shipment: inco1Shipment,
      packMaterialsTr: packMaterialsTr,
      plantName: plantName,
      region: region,
      sBU: sBU,
      sHShipToPartyName: sHShipToPartyName,
      transferEndCustomer: transferEndCustomer,
      transportationZone: transportationZone,
    );

    final data = predictModel.toMap();

    try {
      final response = await dio.post('http://54.165.230.28:8000/api/currency/cost', data: data);
      final doubleFreight = response.data["data"]["Preço estimado do frete"].toString();
      final strFreight = double.parse(doubleFreight).toStringAsFixed(2);

      print(freightCost);
      freightCost = double.parse(strFreight);
    } on Exception catch (e) {
      print(e);
    }
  }
}
