import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/models/passport/PillCard.dart';
import 'package:epilepsy/models/passport/TimeStamp.dart';

class UserDetailPassport extends StatefulWidget {
  @override
  _UserDetailPassportState createState() => _UserDetailPassportState();
}

class _UserDetailPassportState extends State<UserDetailPassport> {
  List<PillCard> initPillDatas = [
    PillCard(
        "1",
        "Carbamazepin / Tegretal",
        "-",
        "คลื่นไส้ ซึม เดินเซ เห็นภาพซ้อน",
        "Hyponatremia (SIADH), Aplastic anemia, ตับอักเสบ เม็ดเลือดขาวต่ำ",
        "skin rash, Steven Johnson syndrome*",
        "assets/images/drug_1.jpg",
        TimeStamp("", "", "", "")),
    PillCard(
        "2",
        "Clonazepam / Rivotril®",
        "-",
        "อ่อนเพลีย ง่วง พฤติกรรมเปลี่ยนแปลง น้ำลายและเสมหะมาก",
        "กดการหายใจ",
        "-",
        "assets/images/drug_2.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "3",
        "Lamotrigine / Lamictal®",
        "-",
        "มึนงง เห็นภาพซ้อน เดินเซ",
        "ผื่น Stevens-Johnson syndrome",
        "-",
        "assets/images/drug_3.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "4",
        "Levetiracetam /  Keppra®",
        "-",
        "ซึม มึนงง",
        "อารมณ์หงุดหงิด ก้าวร้าว",
        "-",
        "assets/images/drug_4.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "5",
        "Oxcarbazepine / Trileptal®",
        "-",
        "มึนงง ง่วงซึม เดินเซ",
        "ภาวะโซเดียมต่ำ",
        "-",
        "assets/images/drug_5.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "6",
        "Phenobarbital",
        "-",
        "เด็ก: ซุกซนไม่อยู่สุข พฤติกรรมเปลี่ยนแปลง ก้าวร้าว ผู้ใหญ่: ง่วงซึม อ่อนเพลีย",
        "ผื่น Stevens-Johnson syndrome",
        "-",
        "assets/images/drug_6.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "7",
        "Phenytoin / Dilantin®",
        "-",
        "เวียนศีรษะ เห็นภาพซ้อน ซึม เดินเซ คลื่นไส้ อาเจียน เหงือกบวม หน้าหยาบ ขนเยอะ สิวเพิ่มขึ้น",
        "ผื่น Stevens-Johnson syndromeตับอักเสบ",
        "-",
        "assets/images/drug_7.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "8",
        "Sodium valproate/ Depakin®",
        "25 mg",
        "มือสั่น คลื่นไส้ อาเจียนปวดท้อง ผมร่วง น้ำหนักเพิ่ม",
        "ตับอักเสบ ตับอ่อนอักเสบ",
        "-",
        "assets/images/drug_8.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "9",
        "Topiramate / Topamax®",
        "-",
        "มึนงง เดินเซ ความคิดเชื่องช้า การพูดผิดปกติ น้ำหนักลด",
        "นิ่วในไต ต้อหิน เหงื่อออกน้อย ",
        "-",
        "assets/images/drug_9.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "10",
        "Vigabatrin / Sabril®",
        "-",
        "มึนงง ง่วงซึม",
        "ความผิดปกติของลานสายตา",
        "-",
        "assets/images/drug_10.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "11",
        "Perampanel / Fycompa®",
        "-",
        "มึนงง ง่วงซึมเดินเซ",
        "หงุดหงิด ก้าวร้าว อาการทางจิต",
        "-",
        "assets/images/drug_11.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "12",
        "Lacosamide / Vimpat®",
        "-",
        "มึนงง ง่วงซึม ภาพซ้อน เดินเซ",
        "Atrioventricular block, palpitation",
        "-",
        "assets/images/drug_12.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "13",
        "Pregabalin / Lyrica®",
        "-",
        "ง่วงนอน ซึม เวียนศีรษะ",
        "มักไม่ค่อยพบ",
        "-",
        "assets/images/drug_13.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "14",
        "Gabapentin / Neurontin® / Berlontin®",
        "-",
        "ง่วงนอน ซึม เวียนศีรษะ",
        "มักไม่ค่อยพบ",
        "-",
        "assets/images/drug_12.png", //no img
        TimeStamp("", "", "", ""))
  ];

  List<String> _dropdownDateItems = [
    "7",
    "15",
    "30",
  ];

  List<String> _dropdownPillItems = [
    "Carbamazepin / Tegretal",
    "Clonazepam / Rivotril®",
    "Lamotrigine / Lamictal®",
    "Levetiracetam /  Keppra®",
    "Oxcarbazepine / Trileptal®",
    "Phenobarbital",
    "Phenytoin / Dilantin®",
    "Sodium valproate/ Depakin®",
    "Topiramate / Topamax®",
    "Vigabatrin / Sabril®",
    "Perampanel / Fycompa®",
    "Lacosamide / Vimpat®",
    "Pregabalin / Lyrica®",
    "Gabapentin / Neurontin® / Berlontin®",
  ];

  List<DropdownMenuItem<String>> _dropdownMenuDateItems;
  List<DropdownMenuItem<String>> _dropdownMenuPillItems;
  String _selectedDate;
  String _selectedPill;
  List<BarChartGroupData> showData;
  double _width = 400;

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
      for (int i = pillBox.length; i >= 0; i--) {
        DateTime now = DateTime.now();
        DateTime newNow = now.subtract(Duration(days: pillBox.length - i - 1));
        String formattedDate = DateFormat('dd').format(newNow);
        String dateKey = DateFormat('yyyy-MM-dd').format(newNow);
        if (pillBox.get(dateKey) == null) {
          pillBox.put(dateKey, initPillDatas);
        }
        final data = pillBox.get(dateKey);
        dynamic findPill(String _name) {
          for (var i = 0; i < data.length; i++) {
            var tempPill = data[i];
            if (tempPill.getName() == _name) {
              return data[i];
            }
          }
          return data[0];
        }

        var pill = findPill(_selectedPill);
        var count = 0;
        final timeStamp = pill.timeStamp;
        if (timeStamp.afterBreak != "") {
          count++;
        }
        if (timeStamp.afterLunch != "") {
          count++;
        }
        if (timeStamp.afterEven != "") {
          count++;
        }
        if (timeStamp.beforeBed != "") {
          count++;
        }
        tempData.add(BarChartGroupData(x: int.parse(formattedDate), barRods: [
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
          i >= pillBox.length - (int.parse(_selectedDate));
          i--) {
        DateTime now = DateTime.now();
        DateTime newNow = now.subtract(Duration(days: pillBox.length - i - 1));
        String formattedDate = DateFormat('dd').format(newNow);
        String dateKey = DateFormat('yyyy-MM-dd').format(newNow);
        if (pillBox.get(dateKey) == null) {
          pillBox.put(dateKey, initPillDatas);
        }
        final data = pillBox.get(dateKey);
        dynamic findPill(String _name) {
          for (var i = 0; i < data.length; i++) {
            if (data[i].name == _name) {
              return data[i];
            }
          }
          return data[0];
        }

        var pill = findPill(_selectedPill);
        var count = 0;
        final timeStamp = pill.timeStamp;
        if (timeStamp.afterBreak != "") {
          count++;
        }
        if (timeStamp.afterLunch != "") {
          count++;
        }
        if (timeStamp.afterEven != "") {
          count++;
        }
        if (timeStamp.beforeBed != "") {
          count++;
        }
        tempData.add(BarChartGroupData(x: int.parse(formattedDate), barRods: [
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
