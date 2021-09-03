import 'package:basf_dashboard/app/modules/dashboard/presenter/widgets/custom-app-bar/custom-app-bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/side-menu/side-menu.widget.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({Key? key}) : super(key: key);

  @override
  _DashboardLayoutState createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar,
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: SideMenu(),
            ),
          ),
          Expanded(
            flex: 30,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              child: RouterOutlet(),
            ),
          ),
        ],
      ),
    );
  }
}
