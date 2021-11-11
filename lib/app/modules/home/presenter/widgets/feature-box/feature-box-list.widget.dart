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
  void didChangeDependencies() {
    store.getCurrencyByType(CurrencyType.usd);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          children: <Widget>[
            Expanded(
              child: FeatureBox(
                icon: FontAwesomeIcons.connectdevelop,
                value: '94%',
                label: 'AI Score',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                icon: FontAwesomeIcons.twitter,
                value: '320',
                label: 'Social Score',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                icon: FontAwesomeIcons.dollarSign,
                value: store.currentPrice == null ? null : '${brlFormat.format(store.currentPrice)}',
                label: 'Preço Dólar',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                icon: FontAwesomeIcons.gasPump,
                value: 'R\$ 10,0',
                label: 'Preço Diesel',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: FeatureBox(
                icon: FontAwesomeIcons.euroSign,
                value: store.currentPrice == null ? null : '${brlFormat.format(store.currentPrice)}',
                label: 'Preço Euro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
