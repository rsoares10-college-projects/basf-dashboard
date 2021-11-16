import 'package:flutter/material.dart';

import '../feature-box/feature-box-list.widget.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FeatureBoxList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
