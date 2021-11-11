import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../dashboard/presenter/stores/dashboard.store.dart';
import '../widgets/home-view-currency-box/home-view-currency-box.widget.dart';
import '../widgets/home-view-header/home-view-header.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ModularState<HomeView, DashboardStore> {
  DateTime _selectedDate = DateTime.now();

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

  Container _textFieldBuilder(String label) {
    return Container(
      constraints: BoxConstraints(maxHeight: 60.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
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
              constraints: BoxConstraints(maxHeight: 400.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ElevatedButton.icon(
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
                          _textFieldBuilder('GDW (Kg)'),
                          _textFieldBuilder('Diesel s10'),
                          _textFieldBuilder('Special Processing Indicator'),
                          _textFieldBuilder('Delivery Item'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Expanded(
                    child: HomeViewCurrencyBox(
                      dollarBuyPriceTextField: _textFieldBuilder('Dóllar compra'),
                      dollarSellPriceTextField: _textFieldBuilder('Dóllar venda'),
                      euroBuyPriceTextField: _textFieldBuilder('Euro Compra'),
                      euroSellPriceTextField: _textFieldBuilder('Euro Venda'),
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
