import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/feature-box/feature-box-list.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final buttonStyle = ElevatedButton.styleFrom(
    primary: Colors.deepPurple.shade400,
    elevation: 1.0,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
    enabledMouseCursor: SystemMouseCursors.click,
    textStyle: TextStyle(
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  );

  _showDatePicker() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2022),
      locale: Locale('pt', 'BR'),
    );
  }

  final materials = <String>[
    'EUPERLAN BRIGHT 200KG 1H2',
    'CETIOL ULTIMATE 155KG 1A1',
    'ORKESTRA® SC,GU4X5 L,BR',
    'PLUG 1/4" BSP-M',
  ];

  final odList = <String>['EM', 'AP', 'EN', 'EB', 'CM', 'CP', 'XB', 'ED', 'PM'];

  final buList = <String>['EMY', 'APY', 'ENY', 'EBS', 'CMS', 'CPE', 'XBZ'];

  final sbuList = <String>['EMB', 'APF', 'APH', 'API', 'APG', 'EMU', 'ENL'];

  final specialProcessingIndicatorList = <int>[1200, 1017, 1201, 1204, 1015, 1016];

  final carrierList = <String>['TRANSPORTES ESTRADEIRO LTDA', 'TRANSPORTES CAVALINHO LTDA'];

  final plantList = <String>['BASF S.A - Jacareí', 'BASF S. A. Posse BASF S/A', 'BASF S.A - Guaratinguetá'];

  final depshippingPointName = <String>['P - Jacarei', 'SP - Sto Ant Posse', 'SP - Guaratinguetá', 'SP - CD Vinhedo', 'SP - Vila Prudente', 'SP - CD Cumbica'];

  final cities = <String>['GUARULHOS', 'GUARATINGUETA', 'SAO PAULO', 'JUNIDIAI', 'MOMBUCA', 'ITAGUAI'];

  DropdownButton _buildDropdown(List itemList) {
    return DropdownButton<dynamic>(
      iconEnabledColor: Colors.deepPurple.shade400,
      isDense: true,
      value: itemList.first,
      underline: SizedBox(),
      style: TextStyle(
        color: Colors.deepPurple.shade400,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      items: itemList.map((value) {
        return DropdownMenuItem<dynamic>(
          value: value,
          child: Text('$value'),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Card(
          elevation: 2.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Dashboard',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.deepPurple.shade300,
                  height: 1.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  flex: 7,
                  child: FeatureBoxList(),
                ),
                Expanded(
                  flex: 25,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: Colors.purple.shade300),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: LineChartSample2(),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 8,
                                  child: LayoutBuilder(
                                    builder: (context, constraints) => Container(
                                      child: ListView(
                                        children: <Widget>[
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'Data',
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 101,
                                              ),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: <Widget>[
                                                  ElevatedButton.icon(
                                                    icon: Icon(
                                                      Icons.date_range,
                                                      size: 20.0,
                                                    ),
                                                    style: buttonStyle,
                                                    onPressed: _showDatePicker,
                                                    label: Text('Data Inicial'),
                                                  ),
                                                  SizedBox(
                                                    width: 15.0,
                                                  ),
                                                  ElevatedButton.icon(
                                                    icon: Icon(
                                                      Icons.date_range,
                                                      size: 20.0,
                                                    ),
                                                    style: buttonStyle,
                                                    onPressed: _showDatePicker,
                                                    label: Text('Data Final'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Delivery Item',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'Material',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 108,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(materials),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'OD',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 76,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(odList),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'BU',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 75,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(buList),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'SBU',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 84,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(sbuList),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Special Processing Indicator',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 234,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(specialProcessingIndicatorList),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'Carrier',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 99,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(carrierList),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'Plant Name',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 130,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(plantList),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'Depshipping point name',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 208,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(depshippingPointName),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: true,
                                            title: 'City',
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: constraints.maxWidth - 81,
                                              ),
                                              alignment: Alignment.centerRight,
                                              child: _buildDropdown(depshippingPointName),
                                            ),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'SH - Ship-To Party',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'SH - Ship-To Party name',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Postal Code',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Region',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Transportation zone',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Pack Materials Tr',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Inco 1 (shipment)',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Country TO',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Gosss Delivery Wt-KG',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'OD Special',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Cidade Origem',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'CPRE',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Estado',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Transfer/EndCustomer',
                                            child: Container(),
                                          ),
                                          FeatureCheckbox(
                                            isChecked: false,
                                            title: 'Cidade/Estado',
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Divider(
                                  height: 0.5,
                                  color: Colors.deepPurple.shade200,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    constraints: BoxConstraints(maxHeight: 15.0),
                                    child: SizedBox(
                                      width: 80.0,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: buttonStyle,
                                        child: Text(
                                          'Estimar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureCheckbox extends StatefulWidget {
  String? title;
  bool? isChecked;
  Widget? child;

  FeatureCheckbox({
    required this.title,
    required this.isChecked,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  FeatureCheckboxState createState() => FeatureCheckboxState();
}

class FeatureCheckboxState extends State<FeatureCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 25.0),
      margin: EdgeInsets.only(bottom: 5.0),
      alignment: Alignment.centerLeft,
      height: double.infinity,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: widget.isChecked ?? false,
              activeColor: Colors.deepPurple.shade400,
              onChanged: (value) {
                setState(() {
                  widget.isChecked = !widget.isChecked!;
                });
              }),
          SizedBox(
            width: 5.0,
          ),
          Text(
            widget.title ?? '',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Visibility(
            visible: widget.isChecked ?? false,
            child: widget.child ?? Container(),
          ),
        ],
      ),
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.deepPurple.shade200,
    Colors.deepPurple.shade900,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 24, bottom: 12),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
        Positioned(
          height: 20.0,
          width: 50.0,
          right: 5,
          top: 5,
          child: Container(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'Ver Média',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      axisTitleData: FlAxisTitleData(
        topTitle: AxisTitle(
          showTitle: true,
          margin: 5.0,
          textAlign: TextAlign.center,
          titleText: 'Frete Estimado',
          textStyle: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 14,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          rotateAngle: 25.0,
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEV';
              case 3:
                return 'ABR';
              case 4:
                return 'MAI';
              case 5:
                return 'JUN';
              case 6:
                return 'JUL';
              case 7:
                return 'JUL';
              case 8:
                return 'AGS';
              case 9:
                return 'SET';
              case 10:
                return 'OUT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEZ';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
              case 7:
                return '60k';
              case 9:
                return '80k';
            }
            return '';
          },
          reservedSize: 30,
          margin: 15,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.deepPurple.shade500, width: 0.5),
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
            FlSpot(12, 7),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (context, value) => const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
          interval: 1,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 32,
          interval: 1,
          margin: 12,
        ),
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!,
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!.withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2)!.withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
