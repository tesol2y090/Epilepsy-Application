import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';
import 'package:epilepsy/views/calendar/components/date_button.dart';

class PillDetailStamp extends StatefulWidget {
  final String _no;
  const PillDetailStamp(this._no);
  @override
  _PillDetailStampState createState() => _PillDetailStampState();
}

class _PillDetailStampState extends State<PillDetailStamp> {
  // bool beforeBreak = false;
  bool afterBreak = false;
  // bool beforeLunch = false;
  bool afterLunch = false;
  // bool beforeEven = false;
  bool afterEven = false;
  bool beforeBed = false;

  var _selectedDate;
  List<GestureDetector> _showDate;

  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    var _tempShowData = List<GestureDetector>();
    for (var i = 0; i < 7; i++) {
      if (i < 3) {
        var date = _selectedDate.subtract(Duration(days: 3 - i));
        var formattedDate = DateFormat('dd').format(date);
        var formattedDateName = DateFormat('EEEE').format(date);
        _tempShowData.add(GestureDetector(
          onTap: () => {
            setState(() => {_showDate = createButton(date)})
          },
          child: DateButton(formattedDateName.substring(0, 3),
              int.parse(formattedDate), false),
        ));
      } else if (i == 3) {
        var date = _selectedDate.subtract(Duration());
        var formattedDate = DateFormat('dd').format(date);
        var formattedDateName = DateFormat('EEEE').format(date);
        _tempShowData.add(GestureDetector(
          onTap: () => {
            setState(() => {_showDate = createButton(date)})
          },
          child: DateButton(formattedDateName.substring(0, 3),
              int.parse(formattedDate), true),
        ));
      } else {
        var date = _selectedDate.add(Duration(days: i - 3));
        var formattedDate = DateFormat('dd').format(date);
        var formattedDateName = DateFormat('EEEE').format(date);
        _tempShowData.add(GestureDetector(
          onTap: () => {
            setState(() => {_showDate = createButton(date)})
          },
          child: DateButton(formattedDateName.substring(0, 3),
              int.parse(formattedDate), false),
        ));
      }
    }
    _showDate = _tempShowData;
  }

  List<GestureDetector> createButton(var newDate) {
    var _tempShowData = List<GestureDetector>();
    setState(() => {_selectedDate = newDate});
    for (var i = 0; i < 7; i++) {
      if (i < 3) {
        var date = newDate.subtract(Duration(days: 3 - i));
        var formattedDate = DateFormat('dd').format(date);
        var formattedDateName = DateFormat('EEEE').format(date);
        _tempShowData.add(GestureDetector(
          onTap: () => {
            setState(() => {_showDate = createButton(date)})
          },
          child: DateButton(formattedDateName.substring(0, 3),
              int.parse(formattedDate), false),
        ));
      } else if (i == 3) {
        var date = newDate.subtract(Duration());
        var formattedDate = DateFormat('dd').format(date);
        var formattedDateName = DateFormat('EEEE').format(date);
        _tempShowData.add(GestureDetector(
          onTap: () => {
            setState(() => {_showDate = createButton(date)})
          },
          child: DateButton(formattedDateName.substring(0, 3),
              int.parse(formattedDate), true),
        ));
      } else {
        var date = newDate.add(Duration(days: i - 3));
        var formattedDate = DateFormat('dd').format(date);
        var formattedDateName = DateFormat('EEEE').format(date);
        _tempShowData.add(GestureDetector(
          onTap: () => {
            setState(() => {_showDate = createButton(date)})
          },
          child: DateButton(formattedDateName.substring(0, 3),
              int.parse(formattedDate), false),
        ));
      }
    }
    return _tempShowData;
  }

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final pillBox = Hive.box('pill_data');
    List<dynamic> pillDatas = pillBox.get(formattedDate);
    findPill(String no) => pillDatas.firstWhere((data) => data.no == no);
    var pill = findPill(widget._no);

    if (pill != null) {
      setState(() {
        afterBreak = pill.timeStamp.afterBreak;
        afterLunch = pill.timeStamp.afterLunch;
        afterEven = pill.timeStamp.afterEven;
        beforeBed = pill.timeStamp.beforeBed;
      });
    }
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        children: [
              SelectDateContainer(_showDate),
          checkList(pill, pillBox, pillDatas, formattedDate)
        ],
      ),
    );
  }

  Widget checkList(pill, pillBox, pillDatas, formattedDate) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(children: [
        // Container(
        //   child:
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //     Text(
        //       "ก่อนอาหารเช้า",
        //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //     ),
        //     Checkbox(
        //       checkColor: Colors.white,
        //       activeColor: Colors.purple,
        //       value: this.beforeBreak,
        //       onChanged: (bool value) {
        //         setState(() {
        //           this.beforeBreak = value;
        //           pillDatas[int.parse(widget._no) - 1].timeStamp
        //               ["beforeBreak"] = value;
        //           pillBox.put(formattedDate, pillDatas);
        //         });
        //       },
        //     ),
        //   ]),
        // ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "หลังอาหารเช้า",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.afterBreak,
              onChanged: (bool value) {
                setState(() {
                  this.afterBreak = value;
                  pillDatas[int.parse(widget._no) - 1].timeStamp.afterBreak =
                      value;
                  pillBox.put(formattedDate, pillDatas);
                });
              },
            ),
          ]),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "หลังอาหารกลางวัน",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.afterLunch,
              onChanged: (bool value) {
                setState(() {
                  this.afterLunch = value;
                  pillDatas[int.parse(widget._no) - 1].timeStamp.afterLunch =
                      value;
                  pillBox.put(formattedDate, pillDatas);
                });
              },
            ),
          ]),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "หลังอาหารเย็น",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.afterEven,
              onChanged: (bool value) {
                setState(() {
                  this.afterEven = value;
                  pillDatas[int.parse(widget._no) - 1].timeStamp.afterEven =
                      value;
                  pillBox.put(formattedDate, pillDatas);
                });
              },
            ),
          ]),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "ก่อนนอน",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.beforeBed,
              onChanged: (bool value) {
                setState(() {
                  this.beforeBed = value;
                  pillDatas[int.parse(widget._no) - 1].timeStamp.beforeBed =
                      value;
                  pillBox.put(formattedDate, pillDatas);
                });
              },
            ),
          ]),
        ),
      ]),
    );
  }

  // Widget checkList(pill, pillBox, pillDatas, formattedDate) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 24),
  //     child: Column(children: [
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "ก่อนอาหารเช้า",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.beforeBreak,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.beforeBreak = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     ["beforeBreak"] = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "หลังอาหารเช้า",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.afterBreak,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.afterBreak = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     .afterBreak = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "ก่อนอาหารกลางวัน",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.beforeLunch,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.beforeLunch = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     ["beforeLunch"] = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "หลังอาหารกลางวัน",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.afterLunch,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.afterLunch = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     .afterLunch = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "ก่อนอาหารเย็น",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.beforeEven,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.beforeEven = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     ["beforeEven"] = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "หลังอาหารเย็น",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.afterEven,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.afterEven = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     .afterEven = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //       Container(
  //         child:
  //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //           Text(
  //             "ก่อนนอน",
  //             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  //           ),
  //           Checkbox(
  //             checkColor: Colors.white,
  //             activeColor: Colors.purple,
  //             value: this.beforeBed,
  //             onChanged: (bool value) {
  //               setState(() {
  //                 this.beforeBed = value;
  //                 pillDatas[int.parse(widget._no) - 1].timeStamp
  //                     .beforeBed = value;
  //                 pillBox.put(formattedDate, pillDatas);
  //               });
  //             },
  //           ),
  //         ]),
  //       ),
  //     ]),
  //   );
  // }

}
