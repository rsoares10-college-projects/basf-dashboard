import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'side-menu-button.widget.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

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
                onPressed: () => Modular.to.navigate('/dashboard/home'),
              ),
              SideMenuButton(
                icon: FontAwesomeIcons.chartLine,
                label: 'Simulator',
                routeTag: '/dashboard/simulator',
                onPressed: () => Modular.to.navigate('/dashboard/simulator'),
              ),
              SideMenuButton(
                icon: FontAwesomeIcons.chartBar,
                label: 'Analytics',
                routeTag: '/dashboard/analytics',
                onPressed: () => Modular.to.navigate('/dashboard/analytics'),
              ),
              Spacer(),
              SideMenuButton(
                icon: FontAwesomeIcons.solidQuestionCircle,
                label: 'About',
                routeTag: '/dashboard/about',
                onPressed: () => Modular.to.navigate('/dashboard/about'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
