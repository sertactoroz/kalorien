import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget2 extends StatelessWidget {
  PieChartWidget2({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Carbohydrates": 44,
  };

  final colorList = <Color>[
    Colors.yellow.shade600,
  ];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartRadius: 69,
      dataMap: dataMap,
      chartType: ChartType.disc,
      baseChartColor: Color.fromARGB(255, 125, 5, 194).withOpacity(0.99),
      colorList: colorList,
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      totalValue: 100,
    );
  }
}
