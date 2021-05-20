import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class UserDetailChuck extends StatefulWidget {
  @override
  _UserDetailChuckState createState() => _UserDetailChuckState();
}

class _UserDetailChuckState extends State<UserDetailChuck> {
  List<String> _dropdownItems = [
    "7",
    "15",
    "30",
    "60",
  ];

  List<DropdownMenuItem<String>> _dropdownMenuItems;
  String _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
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
    return Container(
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 0, 24, 24),
      child: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                DropdownButton<String>(
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    })
              ])),
          Container(
              height: 400,
              child: Expanded(
                child: LineChart(
                  LineChartData(
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(colors: [
                          Colors.purple
                        ], spots: [
                          FlSpot(0, 1),
                          FlSpot(1, 3),
                          FlSpot(2, 10),
                          FlSpot(3, 7),
                          FlSpot(4, 12),
                          FlSpot(5, 13),
                          FlSpot(6, 17),
                          FlSpot(7, 15),
                          FlSpot(8, 20)
                        ])
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}
