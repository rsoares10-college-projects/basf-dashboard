import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../dashboard/presenter/stores/dashboard.store.dart';
import '../widgets/dropdown-menus/carrier-name-list.widget.dart';
import '../widgets/dropdown-menus/inco-1-shipment-list.widget.dart';
import '../widgets/dropdown-menus/material-name-list.widget.dart';
import '../widgets/dropdown-menus/pack-material-list.widget.dart';
import '../widgets/dropdown-menus/plant-name-list.widget.dart';
import '../widgets/dropdown-menus/region-list.widget.dart';
import '../widgets/dropdown-menus/sbu-name-list.widget.dart';
import '../widgets/dropdown-menus/state-list.widget.dart';
import '../widgets/dropdown-menus/transfer-end-customer-radio-box.widget.dart';
import '../widgets/dropdown-menus/transportation-zone-list.widget.dart';
import '../widgets/home-view-currency-box/home-view-currency-box.widget.dart';
import '../widgets/home-view-header/home-view-header.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ModularState<HomeView, DashboardStore> {
  DateTime _selectedDate = DateTime.now();

  @override
  void didChangeDependencies() async {
    await store.loadLocalBASFData();
    super.didChangeDependencies();
  }

  final _textFieldLabelStyle = TextStyle(
    fontSize: 12,
    color: Colors.deepPurple,
    fontWeight: FontWeight.bold,
  );

  final buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepPurple.shade400,
    elevation: 1.0,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
    enabledMouseCursor: SystemMouseCursors.click,
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  );

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2018),
      lastDate: DateTime(2022),
      locale: Locale('pt', 'BR'),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  Container _textFieldBuilder({String? label, String? hintText}) {
    return Container(
      constraints: BoxConstraints(maxHeight: 40.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label ?? null,
          hintText: hintText ?? null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade200, width: 1.0),
          ),
          hintStyle: TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            gapPadding: 5.0,
          ),
          labelStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox.expand(
        child: ListView(
          children: <Widget>[
            HomeViewHeader(),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(maxWidth: 130.0),
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: _selectDate,
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.deepPurple.shade500,
                                    ),
                                    label: Text(
                                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Colors.white,
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: MaterialNameList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(maxWidth: 130.0),
                                  child: SBUNameList(),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: CarrierNameList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(maxWidth: 130.0),
                                  child: TransportationZoneList(),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: PlantNameList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(maxWidth: 130.0),
                                  child: RegionList(),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: StateList(),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: PackMaterialList(),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            constraints: BoxConstraints(maxHeight: 40.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints(maxWidth: 130.0),
                                  child: Inco1ShipmentList(),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Expanded(
                                  child: TransferEndCustomerRadioBox(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HomeViewCurrencyBox(
                          dollarBuyPriceTextField: _textFieldBuilder(hintText: 'Dólar Compra'),
                          dollarSellPriceTextField: _textFieldBuilder(hintText: 'Dólar Venda'),
                          euroBuyPriceTextField: _textFieldBuilder(hintText: 'Euro Compra'),
                          euroSellPriceTextField: _textFieldBuilder(hintText: 'Euro Venda'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: 90.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 105.0),
                                        width: double.infinity,
                                        child: Text(
                                          'Preço Diesel (S10)',
                                          style: _textFieldLabelStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 110.0),
                                        width: double.infinity,
                                        child: Text(
                                          'Delivery Item',
                                          style: _textFieldLabelStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: 240.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child: _textFieldBuilder(hintText: 'Diesel S10 ')),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(child: _textFieldBuilder(hintText: 'Delivery Item ')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 105.0),
                                        width: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'GDW (Kg)',
                                          style: _textFieldLabelStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 110.0),
                                        width: double.infinity,
                                        child: Text(
                                          'Special PI',
                                          style: _textFieldLabelStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      constraints: BoxConstraints(maxWidth: 240.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(child: _textFieldBuilder(hintText: 'GDW')),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Expanded(
                                            child: _textFieldBuilder(hintText: 'Special PI'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 250.0),
                          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                          height: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: _selectDate,
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple.shade500,
                                ),
                                child: Text(
                                  'ESTIMAR FRETE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                'R\$ 0,00',
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
