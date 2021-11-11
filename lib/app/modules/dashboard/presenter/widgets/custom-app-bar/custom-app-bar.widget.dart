import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../stores/dashboard.store.dart';

final dashboardStore = Modular.get<DashboardStore>();

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
      SizedBox(
        width: 15.0,
      ),
      Expanded(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 30.0, maxHeight: 30.0),
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: ElevatedButton(
                      onPressed: () async => await dashboardStore.refreshDashboard(),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        onPrimary: Colors.deepPurpleAccent,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Icon(
                        Icons.refresh_rounded,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Flexible(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 30.0, maxHeight: 30.0),
                  height: double.infinity,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        onPrimary: Colors.deepPurpleAccent,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: 14.0,
      )
    ],
  ),
);
