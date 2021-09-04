import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final customAppBar = AppBar(
  elevation: 2,
  backgroundColor: Colors.white,
  automaticallyImplyLeading: false,
  title: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 50.0),
        child: FittedBox(
          child: Text(
            'BASF\nDashboard',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
      SizedBox(
        width: 30.0,
      ),
      Icon(
        Icons.menu,
        color: Colors.purple,
      ),
      SizedBox(
        width: 20.0,
      ),
      Container(
        constraints: BoxConstraints(maxWidth: 250.0, maxHeight: 30.0),
        padding: EdgeInsets.only(left: 10.0),
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.purple),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Seach',
          ),
        ),
      ),
      Spacer(),
      Icon(
        Icons.notifications_none,
        color: Colors.purple,
        size: 20.0,
      ),
      SizedBox(
        width: 15.0,
      ),
      Icon(
        FontAwesomeIcons.userAlt,
        color: Colors.purple,
        size: 15.0,
      ),
      SizedBox(
        width: 25.0,
      ),
    ],
  ),
);
