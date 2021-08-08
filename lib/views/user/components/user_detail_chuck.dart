import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

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
  List<BarChartGroupData> showData;

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
      List<BarChartGroupData> tempData = [];
      for (int i = 0; i < chuckBox.length; i++) {
        DateTime now = DateTime.now();
        DateTime newNow = now.subtract(Duration(days: chuckBox.length - i - 1));
        String formattedDate = DateFormat('dd').format(newNow);
        final data = chuckBox.getAt(i);
        tempData.add(BarChartGroupData(x: int.parse(formattedDate), barRods: [
          BarChartRodData(
              y: data.length.toDouble(), width: 15, colors: [Colors.purple]),
        ]));
      }
      setState(() {
        showData = tempData;
      });
    } else {
      List<BarChartGroupData> tempData = [];
      for (int i = chuckBox.length - 1;
          i < chuckBox.length - int.parse(_selectedDate) - 1;
          i--) {
        DateTime now = DateTime.now();
        DateTime newNow = now.subtract(Duration(days: chuckBox.length - i - 1));
        String formattedDate = DateFormat('dd').format(newNow);
        final data = chuckBox.getAt(i);
        tempData.add(BarChartGroupData(x: int.parse(formattedDate), barRods: [
          BarChartRodData(
              y: data.length.toDouble(), width: 15, colors: [Colors.purple]),
        ]));
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
                          : BarChart(BarChartData(
                              alignment: BarChartAlignment.center,
                              titlesData: FlTitlesData(
                                show: true,
                                bottomTitles: SideTitles(
                                  showTitles: true,
                                  getTextStyles: (value) => const TextStyle(
                                      color: Colors.black, fontSize: 10),
                                  margin: 10,
                                ),
                              ),
                              borderData: FlBorderData(
                                  border: Border(
                                top: BorderSide.none,
                                right: BorderSide.none,
                                left: BorderSide(width: 1),
                                bottom: BorderSide(width: 1),
                              )),
                              barGroups: showData)))
                ],
              ))
        ],
      ),
    );
  }
}
