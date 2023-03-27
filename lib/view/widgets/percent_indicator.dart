import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatelessWidget {
  PieChartWidget({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Karbonhidrat": 44,
    "Protein": 17,
    "Yağ": 19
  };

  final colorList = <Color>[Colors.blue, Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartRadius: 150,
      dataMap: dataMap,
      chartType: ChartType.ring,
      baseChartColor: Color.fromARGB(255, 202, 26, 26).withOpacity(0.15),
      colorList: colorList,
      chartValuesOptions: ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
      totalValue: 100,
    );
  }
}
