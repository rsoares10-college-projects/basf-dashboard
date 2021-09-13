import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../currency/domain/enums/currency-type.enum.dart';
import '../../../../currency/presenter/stores/currency.store.dart';
import 'featue-box.widget.dart';

class FeatureBoxList extends StatefulWidget {
  const FeatureBoxList({
    Key? key,
  }) : super(key: key);

  @override
  _FeatureBoxListState createState() => _FeatureBoxListState();
}

class _FeatureBoxListState extends ModularState<FeatureBoxList, CurrencyStore> {
  final brlFormat = NumberFormat('R\$ #.##', 'pt_BR');

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    store.getCurrencyByType(CurrencyType.usd);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: FeatureBox(
                backgroundColor: Colors.deepPurple,
                borderColor: Colors.deepPurple,
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
                detailIconColor: Colors.deepPurple,
                icon: FontAwesomeIcons.connectdevelop,
                value: '435',
                label: 'IA Score',
                detailStyle: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
                valueStyle: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                backgroundColor: Color(0xFF02abef),
                borderColor: Color(0xFF02abef),
                labelStyle: TextStyle(color: Colors.white, fontSize: 13.0),
                detailIconColor: Color(0xFF02abef),
                icon: Icons.chat_bubble_rounded,
                value: '320',
                label: 'Social Score',
                detailStyle: TextStyle(
                  color: Color(0xFF02abef),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
                valueStyle: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                borderColor: Colors.green,
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white, fontSize: 13.0),
                detailStyle: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
                detailIconColor: Colors.green,
                valueStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                icon: FontAwesomeIcons.coins,
                value: store.currentPrice == null ? null : '${brlFormat.format(store.currentPrice)}',
                label: 'Preço Dólar',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                borderColor: Colors.deepOrange,
                detailStyle: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
                backgroundColor: Colors.deepOrange,
                detailIconColor: Colors.deepOrange,
                labelStyle: TextStyle(color: Colors.white, fontSize: 13.0),
                valueStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
                icon: Icons.local_shipping,
                value: 'R\$ 10,0',
                label: 'Frete Estimado',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
