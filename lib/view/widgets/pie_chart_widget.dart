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
      animationDuration: Duration(milliseconds: 3000),
      chartLegendSpacing: 30,
      ringStrokeWidth: 30,
      chartRadius: MediaQuery.of(context).size.width / 3,
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
