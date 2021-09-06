import 'package:basf_dashboard/app/modules/dashboard/presenter/stores/dashboard.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SideMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String routeTag;
  final VoidCallback? onPressed;

  final dashboardStore = Modular.get<DashboardStore>();

  SideMenuButton({
    required this.icon,
    required this.label,
    required this.routeTag,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
        constraints: BoxConstraints(maxHeight: 50.0, maxWidth: 65.0),
        margin: const EdgeInsets.only(bottom: 5.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: dashboardStore.currentRoute == routeTag ? Colors.deepPurple : Colors.deepPurple.shade300,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 2,
            onPrimary: Colors.deepPurple,
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            enabledMouseCursor: SystemMouseCursors.click,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 14.0,
                color: dashboardStore.currentRoute == routeTag ? Colors.deepPurple : Colors.deepPurple.shade300,
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 40.0, maxHeight: 11.0),
                height: double.infinity,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: dashboardStore.currentRoute == routeTag ? Colors.deepPurple : Colors.deepPurple.shade300,
                      fontWeight: dashboardStore.currentRoute == routeTag ? FontWeight.w800 : FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
