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
              color: Colors.deepPurple,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      SizedBox(
        width: 30.0,
      ),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: Colors.deepPurple,
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Container(
        constraints: BoxConstraints(maxWidth: 250.0, maxHeight: 30.0),
        padding: EdgeInsets.only(left: 10.0),
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.deepPurple.shade200, fontWeight: FontWeight.bold),
            hintText: 'Buscar...',
          ),
        ),
      ),
      Spacer(),
      IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.settings,
          color: Colors.deepPurple,
          size: 20.0,
        ),
      ),
      SizedBox(
        width: 25.0,
      ),
    ],
  ),
);
