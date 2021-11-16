import 'dart:convert';

class PredictModel {
  int deliveryItem;
  String materialName;
  String sBU;
  int specialProcessingIndicator;
  String carrier;
  String plantName;
  String depshippingPointName;
  String sHShipToPartyName;
  String region;
  String transportationZone;
  String packMaterialsTr;
  String inco1Shipment;
  double gDWKg;
  String cPRE;
  String estado;
  String transferEndCustomer;
  double dieselS10;
  double dolarCompra;
  double dolarVenda;
  double euroCompra;
  double euroVenda;
  PredictModel({
    required this.deliveryItem,
    required this.materialName,
    required this.sBU,
    required this.specialProcessingIndicator,
    required this.carrier,
    required this.plantName,
    required this.depshippingPointName,
    required this.sHShipToPartyName,
    required this.region,
    required this.transportationZone,
    required this.packMaterialsTr,
    required this.inco1Shipment,
    required this.gDWKg,
    required this.cPRE,
    required this.estado,
    required this.transferEndCustomer,
    required this.dieselS10,
    required this.dolarCompra,
    required this.dolarVenda,
    required this.euroCompra,
    required this.euroVenda,
  });

  Map<String, dynamic> toMap() {
    return {
      'deliveryItem': deliveryItem,
      'materialName': materialName,
      'sBU': sBU,
      'specialProcessingIndicator': specialProcessingIndicator,
      'carrier': carrier,
      'plantName': plantName,
      'depshippingPointName': depshippingPointName,
      'sHShipToPartyName': sHShipToPartyName,
      'region': region,
      'transportationZone': transportationZone,
      'packMaterialsTr': packMaterialsTr,
      'inco1Shipment': inco1Shipment,
      'gDWKg': gDWKg,
      'cPRE': cPRE,
      'estado': estado,
      'transferEndCustomer': transferEndCustomer,
      'dieselS10': dieselS10,
      'dolarCompra': dolarCompra,
      'dolarVenda': dolarVenda,
      'euroCompra': euroCompra,
      'euroVenda': euroVenda,
    };
  }

  factory PredictModel.fromMap(Map<String, dynamic> map) {
    return PredictModel(
      deliveryItem: map['deliveryItem'],
      materialName: map['materialName'],
      sBU: map['sBU'],
      specialProcessingIndicator: map['specialProcessingIndicator'],
      carrier: map['carrier'],
      plantName: map['plantName'],
      depshippingPointName: map['depshippingPointName'],
      sHShipToPartyName: map['sHShipToPartyName'],
      region: map['region'],
      transportationZone: map['transportationZone'],
      packMaterialsTr: map['packMaterialsTr'],
      inco1Shipment: map['inco1Shipment'],
      gDWKg: map['gDWKg'],
      cPRE: map['cPRE'],
      estado: map['estado'],
      transferEndCustomer: map['transferEndCustomer'],
      dieselS10: map['dieselS10'],
      dolarCompra: map['dolarCompra'],
      dolarVenda: map['dolarVenda'],
      euroCompra: map['euroCompra'],
      euroVenda: map['euroVenda'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PredictModel.fromJson(String source) => PredictModel.fromMap(json.decode(source));
}
