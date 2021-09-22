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
  double _width = 400;

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
      for (int i = chuckBox.length; i >= 0; i--) {
        DateTime now = DateTime.now();
        DateTime newNow = now.subtract(Duration(days: chuckBox.length - i - 1));
        String formattedDate = DateFormat('dd').format(newNow);
        String dateKey = DateFormat('yyyy-MM-dd').format(newNow);
        if (chuckBox.get(dateKey) == null) {
          chuckBox.put(dateKey, []);
        }
        final data = chuckBox.get(dateKey);
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
      for (int i = chuckBox.length-1;
          i >= chuckBox.length - (int.parse(_selectedDate));
          i--) {
        DateTime now = DateTime.now();
        DateTime newNow = now.subtract(Duration(days: chuckBox.length - i - 1));
        String formattedDate = DateFormat('dd').format(newNow);
        String dateKey = DateFormat('yyyy-MM-dd').format(newNow);
        if (chuckBox.get(dateKey) == null) {
          chuckBox.put(dateKey, []);
        }
        final data = chuckBox.get(dateKey);
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
                    switch (_selectedDate) {
                      case "7":
                        _width = 200;
                        break;
                      case "15":
                        _width = 500;
                        break;
                      case "30":
                        _width = 1000;
                        break;
                      default:
                        _width = 400;
                    }
                  });
                })
          ])),
          Container(
              height: 250,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      width: _width,
                      padding: EdgeInsets.all(8),
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
                              barGroups: showData)))))
        ],
      ),
    );
  }
}
