import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../dashboard/presenter/stores/dashboard.store.dart';
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 120.0),
                      child: Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      _textFieldBuilder('Dólar Compra'),
                                      _textFieldBuilder('Dólar Venda'),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      _textFieldBuilder('Euro Compra'),
                                      _textFieldBuilder('Euro Venda'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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



// elevation: 1.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5.0),
//           ),

// ListView(
//             padding: EdgeInsets.symmetric(vertical: 10.0),
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(left: 10.0),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Dashboard',
//                     style: TextStyle(
//                       color: Colors.deepPurple,
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 5.0,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Divider(
//                   color: Colors.deepPurple.shade300,
//                   height: 1.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Expanded(
//                 flex: 6,
//                 child: FeatureBoxList(),
//               ),
//               Expanded(
//                 flex: 26,
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         constraints: BoxConstraints(maxHeight: 600.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Expanded(
//                               child: Container(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     ElevatedButton.icon(
//                                       onPressed: _selectDate,
//                                       style: ElevatedButton.styleFrom(
//                                         primary: Colors.deepPurple.shade500,
//                                       ),
//                                       label: Text(
//                                         '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white,
//                                           fontSize: 14.0,
//                                         ),
//                                       ),
//                                       icon: Icon(
//                                         Icons.calendar_today_rounded,
//                                         color: Colors.white,
//                                         size: 18.0,
//                                       ),
//                                     ),
//                                     _textFieldBuilder('GDW (Kg)'),
//                                     _textFieldBuilder('Diesel s10'),
//                                     _textFieldBuilder('Special Processing Indicator'),
//                                     _textFieldBuilder('Delivery Item'),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 50.0,
//                             ),
//                             Expanded(
//                               child: Container(
//                                 child: Container(
//                                   constraints: BoxConstraints(maxHeight: 300.0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                     color: Colors.deepPurple.shade100,
//                                   ),
//                                   child: Row(
//                                     children: <Widget>[
//                                       Expanded(
//                                         child: Container(
//                                           child: Column(
//                                             children: <Widget>[
//                                               _textFieldBuilder('Dólar Compra'),
//                                               _textFieldBuilder('Dólar Venda'),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20.0,
//                                       ),
//                                       Expanded(
//                                         child: Container(
//                                           child: Column(
//                                             children: <Widget>[
//                                               _textFieldBuilder('Euro Compra'),
//                                               _textFieldBuilder('Euro Venda'),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
