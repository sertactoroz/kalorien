import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget4 extends StatelessWidget {
  PieChartWidget4({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Calories": 34,
  };

  final colorList = <Color>[
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartRadius: 69,
      dataMap: dataMap,
      chartType: ChartType.disc,
      baseChartColor: Colors.yellow.withOpacity(0.99),
      colorList: colorList,
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      totalValue: 100,
    );
  }
}
