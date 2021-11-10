import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../stores/dashboard.store.dart';
import 'side-menu-button.widget.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key}) : super(key: key);

  final dashboardStore = Modular.get<DashboardStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              SideMenuButton(
                icon: FontAwesomeIcons.home,
                label: 'Home',
                routeTag: '/dashboard/home',
                onPressed: () {
                  dashboardStore.setRoute('/dashboard/home');
                  Modular.to.navigate('/dashboard/home');
                },
              ),
              SideMenuButton(
                icon: FontAwesomeIcons.chartLine,
                label: 'Analytics',
                routeTag: '/dashboard/analytics',
                onPressed: () {
                  dashboardStore.setRoute('/dashboard/analytics');
                  Modular.to.navigate('/dashboard/analytics');
                },
              ),
              SideMenuButton(
                icon: FontAwesomeIcons.coins,
                label: 'Moeda',
                routeTag: '/dashboard/currency',
                onPressed: () {
                  dashboardStore.setRoute('/dashboard/currency');
                  Modular.to.navigate('/dashboard/currency');
                },
              ),
              SideMenuButton(
                icon: Icons.chat_bubble,
                label: 'Social',
                routeTag: '/dashboard/soial',
                onPressed: () {
                  dashboardStore.setRoute('/dashboard/soial');
                  Modular.to.navigate('/dashboard/social');
                },
              ),
              SideMenuButton(
                icon: FontAwesomeIcons.gasPump,
                label: 'Diesel',
                routeTag: '/dashboard/diesel',
                onPressed: () {
                  dashboardStore.setRoute('/dashboard/diesel');
                  Modular.to.navigate('/dashboard/diesel');
                },
              ),
              Spacer(),
              SideMenuButton(
                icon: FontAwesomeIcons.solidQuestionCircle,
                label: 'About',
                routeTag: '/dashboard/about',
                onPressed: () {
                  dashboardStore.setRoute('/dashboard/about');
                  Modular.to.navigate('/dashboard/about');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
