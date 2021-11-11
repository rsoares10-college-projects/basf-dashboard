import 'package:flutter/material.dart';

import '../feature-box/feature-box-list.widget.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                color: Colors.deepPurple.shade300,
                height: 1.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            FeatureBoxList(),
          ],
        ),
      ),
    );
  }
}
