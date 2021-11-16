import 'package:flutter/material.dart';

class TransferEndCustomerRadioBox extends StatelessWidget {
  TransferEndCustomerRadioBox({
    Key? key,
  }) : super(key: key);

  final _radioLabelTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.grey.shade600,
  );

  final _radioTextStyle = TextStyle(
    fontSize: 14,
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
            height: 5.0,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                FittedBox(
                  child: Radio(
                    groupValue: 0,
                    value: 0,
                    onChanged: (value) {},
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
                    groupValue: 0,
                    value: 0,
                    onChanged: (value) {},
                  ),
                ),
                FittedBox(
                  child: Text('Transfer', style: _radioTextStyle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
