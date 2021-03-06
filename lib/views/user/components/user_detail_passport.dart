import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';

class UserDetailPassport extends StatefulWidget {
  @override
  _UserDetailPassportState createState() => _UserDetailPassportState();
}

class _UserDetailPassportState extends State<UserDetailPassport> {
  List<String> _dropdownDateItems = [
    "7",
    "15",
    "30",
  ];

  List<String> _dropdownPillItems = [
    "Carbamazepin / Tegretal",
    "Gabapentin / Berliontin",
    "Levetiracetam / Keppra",
    "Oxcarbazepine / Trileptal",
    "Phenobarbital",
    "Phenytoin / Dilantin",
    "Perampanel / Fycompa",
    "Pregabalin / Lyrica",
    "Sodium valproate / Depakin",
    "Topiramate /Topamax",
    "Vigabatrin / Sabril",
    "Lacosamide",
  ];

  List<DropdownMenuItem<String>> _dropdownMenuDateItems;
  List<DropdownMenuItem<String>> _dropdownMenuPillItems;
  String _selectedDate;
  String _selectedPill;
  List<BarChartGroupData> showData;

  void initState() {
    super.initState();
    _dropdownMenuDateItems = buildDropDownMenuItems(_dropdownDateItems);
    _dropdownMenuPillItems = buildDropDownMenuPillItems(_dropdownPillItems);
    _selectedDate = _dropdownMenuDateItems[0].value;
    _selectedPill = _dropdownMenuPillItems[0].value;
    showData = [];
  }

  List<DropdownMenuItem<String>> buildDropDownMenuPillItems(List listItems) {
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
    final pillBox = Hive.box('pill_data');
    if (pillBox.length <= int.parse(_selectedDate)) {
      List<BarChartGroupData> tempData = [];
      for (int i = 0; i < pillBox.length; i++) {
        final data = pillBox.getAt(i);
        findPill(String no) => data.firstWhere((data) => data["name"] == no);
        var pill = findPill(_selectedPill);
        var count = 0;
        pill["time_stamp"].forEach((k, v) => {
              if (v) {count++}
            });
        tempData.add(BarChartGroupData(x: i, barRods: [
          BarChartRodData(
              y: count.toDouble(), width: 15, colors: [Colors.purple]),
        ]));
      }
      setState(() {
        showData = tempData;
      });
    } else {
      List<BarChartGroupData> tempData = [];
      for (int i = pillBox.length - 1;
          i < pillBox.length - int.parse(_selectedDate) - 1;
          i--) {
        final data = pillBox.getAt(i);
        findPill(String no) => data.firstWhere((data) => data["name"] == no);
        var pill = findPill(_selectedPill);
        var count = 0;
        pill["time_stamp"].forEach((k, v) => {
              if (v) {count++}
            });
        tempData.add(BarChartGroupData(x: i, barRods: [
          BarChartRodData(
              y: count.toDouble(), width: 15, colors: [Colors.purple]),
        ]));
      }
      setState(() {
        showData = tempData;
      });
    }
    return Container(
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(0, 0, 24, 0),
      child: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: DropdownButton<String>(
                      value: _selectedPill,
                      items: _dropdownMenuPillItems,
                      onChanged: (value) {
                        setState(() {
                          _selectedPill = value;
                        });
                      }),
                ),
                DropdownButton<String>(
                    value: _selectedDate,
                    items: _dropdownMenuDateItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedDate = value;
                      });
                    })
              ])),
          Container(
              height: 400,
              child: Expanded(
                  child: showData.length == 0
                      ? Text("No data")
                      : BarChart(BarChartData(
                      borderData: FlBorderData(
                          border: Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide(width: 1),
                        bottom: BorderSide(width: 1),
                      )),
                      barGroups: showData))))
        ],
      ),
    );
  }
}
