import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'featue-box.widget.dart';

class FeatureBoxList extends StatelessWidget {
  const FeatureBoxList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FeatureBox(
            backgroundColor: Colors.blueAccent,
            borderColor: Colors.blueAccent,
            labelStyle: TextStyle(color: Colors.white, fontSize: 30.0),
            detailIconColor: Colors.blueAccent,
            icon: Icons.chat_bubble_rounded,
            value: '320',
            label: 'Social Score',
            detailStyle: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 10.0),
            valueStyle: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          SizedBox(
            width: 20.0,
          ),
          FeatureBox(
            borderColor: Colors.green,
            backgroundColor: Colors.green,
            labelStyle: TextStyle(color: Colors.white, fontSize: 30.0),
            detailStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 10.0),
            detailIconColor: Colors.green,
            valueStyle: TextStyle(color: Colors.white, fontSize: 14.0),
            icon: FontAwesomeIcons.coins,
            value: 'R\$ 5,70',
            label: 'Pre;o D[olar',
          ),
          SizedBox(
            width: 20.0,
          ),
          FeatureBox(
            borderColor: Colors.amber,
            detailStyle: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 10.0),
            backgroundColor: Colors.amber,
            detailIconColor: Colors.amber,
            labelStyle: TextStyle(color: Colors.white, fontSize: 30.0),
            valueStyle: TextStyle(color: Colors.white, fontSize: 14.0),
            icon: Icons.local_shipping,
            value: 'R\$ 10,0',
            label: 'Frete Estimado',
          ),
        ],
      ),
    );
  }
}
