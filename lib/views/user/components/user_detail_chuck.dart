import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';

class UserDetailChuck extends StatefulWidget {
  @override
  _UserDetailChuckState createState() => _UserDetailChuckState();
}

class _UserDetailChuckState extends State<UserDetailChuck> {
  List<String> _dropdownItems = [
    "7",
    "15",
    "30",
  ];

  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedDate;
  List<FlSpot> showData;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedDate = _dropdownMenuItems[0].value;
    showData = [];
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<String>> items = List();
    for (String listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final chuckBox = Hive.box('chuck_data');
    if (chuckBox.length <= int.parse(_selectedDate)) {
      List<FlSpot> tempData = [];
      for (int i = 0; i < chuckBox.length; i++) {
        // final date = chuckBox.keys;
        final data = chuckBox.getAt(i);
        tempData.add(FlSpot(i.toDouble(), data.length.toDouble()));
      }
      setState(() {
        showData = tempData;
      });
    } else {
      List<FlSpot> tempData = [];
      for (int i = chuckBox.length - 1;
          i < chuckBox.length - int.parse(_selectedDate) - 1;
          i--) {
        // final date = chuckBox.keys;
        final data = chuckBox.getAt(i);
        tempData.add(FlSpot(i.toDouble(), data.length.toDouble()));
      }
      setState(() {
        showData = tempData;
      });
    }
    return Container(
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: ListView(
        children: [
          Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            DropdownButton<String>(
                value: _selectedDate,
                items: _dropdownMenuItems,
                onChanged: (value) {
                  setState(() {
                    _selectedDate = value;
                  });
                })
          ])),
          Container(
            height: 400,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 1,
                    child: showData.length == 0
                        ? Text("No data")
                        : LineChart(
                            LineChartData(
                                borderData: FlBorderData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                      colors: [Colors.purple], spots: showData)
                                ]),
                          ),
                )
                ],
              ))
        ],
      ),
    );
  }
}
