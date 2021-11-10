import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/dashboard.store.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({Key? key}) : super(key: key);

  @override
  _AnalyticsViewState createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends ModularState<AnalyticsView, DashboardStore> {
  final _iframeSrc =
      'https://app.powerbi.com/reportEmbed?reportId=85ab2742-877e-4b20-8ddc-b7826736635d&autoAuth=true&ctid=11dbbfe2-89b8-4549-be10-cec364e59551&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly93YWJpLXNvdXRoLWNlbnRyYWwtdXMtcmVkaXJlY3QuYW5hbHlzaXMud2luZG93cy5uZXQvIn0%3D';
  final _iframeElement = IFrameElement();

  @override
  void initState() {
    _iframeElement.src = _iframeSrc;
    _iframeElement.style.border = 'none';

    ui.platformViewRegistry.registerViewFactory('iframeElement', (viewId) => _iframeElement);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Expanded(
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}
