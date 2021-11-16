import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../dashboard/presenter/stores/dashboard.store.dart';

class TransferEndCustomerRadioBox extends StatefulWidget {
  TransferEndCustomerRadioBox({
    Key? key,
  }) : super(key: key);

  @override
  State<TransferEndCustomerRadioBox> createState() => _TransferEndCustomerRadioBoxState();
}

class _TransferEndCustomerRadioBoxState extends ModularState<TransferEndCustomerRadioBox, DashboardStore> {
  final _radioLabelTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.deepPurple,
    fontWeight: FontWeight.bold,
  );

  final _radioTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black54,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Transfer/EndCustomer', style: _radioLabelTextStyle),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Observer(
              builder: (_) => Row(
                children: <Widget>[
                  FittedBox(
                    child: Radio(
                      groupValue: store.radioGroupValue,
                      value: 0,
                      onChanged: (value) {
                        store.onRadioChane(value as int);
                      },
                    ),
                  ),
                  FittedBox(
                    child: Text('EndCustomer', style: _radioTextStyle),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FittedBox(
                    child: Radio(
                      groupValue: store.radioGroupValue,
                      value: 1,
                      onChanged: (value) {
                        store.onRadioChane(value as int);
                      },
                    ),
                  ),
                  FittedBox(
                    child: Text('Transfer', style: _radioTextStyle),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
