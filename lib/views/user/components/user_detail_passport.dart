import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class UserDetailPassport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: ListView(
        children: [
          Container(
              height: 400,
              child: Expanded(
                  child: BarChart(BarChartData(
                      borderData: FlBorderData(
                          border: Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                      )),
                      barGroups: [
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(y: 3, width: 15, colors: [Colors.amber]),
                      BarChartRodData(y: 4.2, width: 15, colors: [Colors.red]),
                      BarChartRodData(y: 5, width: 15, colors: [Colors.blue]),
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(y: 8, width: 15, colors: [Colors.amber]),
                      BarChartRodData(y: 6.2, width: 15, colors: [Colors.red]),
                      BarChartRodData(y: 9, width: 15, colors: [Colors.blue]),
                    ]),
                  ]))))
        ],
      ),
    );
  }
}
