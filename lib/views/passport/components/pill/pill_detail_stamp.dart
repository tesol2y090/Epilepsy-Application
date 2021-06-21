import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';

class PillDetailStamp extends StatefulWidget {
  final String _no;
  const PillDetailStamp(this._no);
  @override
  _PillDetailStampState createState() => _PillDetailStampState();
}

class _PillDetailStampState extends State<PillDetailStamp> {
  bool beforeBreak = false;
  bool afterBreak = false;
  bool beforeLunch = false;
  bool afterLunch = false;
  bool beforeEven = false;
  bool afterEven = false;
  bool beforeBed = false;

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final pillBox = Hive.box('pill_data');
    List<dynamic> pillDatas = pillBox.get(formattedDate);
    findPill(String no) => pillDatas.firstWhere((data) => data["no"] == no);
    var pill = findPill(widget._no);

    if (pill != null) {
      setState(() {
        this.beforeBreak = pill["time_stamp"]["beforeBreak"];
        afterBreak = pill["time_stamp"]["afterBreak"];
        beforeLunch = pill["time_stamp"]["beforeLunch"];
        afterLunch = pill["time_stamp"]["afterLunch"];
        beforeEven = pill["time_stamp"]["beforeEven"];
        afterEven = pill["time_stamp"]["afterEven"];
        beforeBed = pill["time_stamp"]["beforeBed"];
      });
    }
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        children: [
              SelectDateContainer(),
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
        //           pillDatas[int.parse(widget._no) - 1]["time_stamp"]
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
                  pillDatas[int.parse(widget._no) - 1]["time_stamp"]
                      ["afterBreak"] = value;
                  pillBox.put(formattedDate, pillDatas);
                });
              },
            ),
          ]),
        ),
        // Container(
        //   child:
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //     Text(
        //       "ก่อนอาหารกลางวัน",
        //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //     ),
        //     Checkbox(
        //       checkColor: Colors.white,
        //       activeColor: Colors.purple,
        //       value: this.beforeLunch,
        //       onChanged: (bool value) {
        //         setState(() {
        //           this.beforeLunch = value;
        //           pillDatas[int.parse(widget._no) - 1]["time_stamp"]
        //               ["beforeLunch"] = value;
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
                  pillDatas[int.parse(widget._no) - 1]["time_stamp"]
                      ["afterLunch"] = value;
                  pillBox.put(formattedDate, pillDatas);
                });
              },
            ),
          ]),
        ),
        // Container(
        //   child:
        //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        //     Text(
        //       "ก่อนอาหารเย็น",
        //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //     ),
        //     Checkbox(
        //       checkColor: Colors.white,
        //       activeColor: Colors.purple,
        //       value: this.beforeEven,
        //       onChanged: (bool value) {
        //         setState(() {
        //           this.beforeEven = value;
        //           pillDatas[int.parse(widget._no) - 1]["time_stamp"]
        //               ["beforeEven"] = value;
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
                  pillDatas[int.parse(widget._no) - 1]["time_stamp"]
                      ["afterEven"] = value;
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
                  pillDatas[int.parse(widget._no) - 1]["time_stamp"]
                      ["beforeBed"] = value;
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
  //                     ["afterBreak"] = value;
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
  //                     ["afterLunch"] = value;
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
  //                     ["afterEven"] = value;
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
  //                 pillDatas[int.parse(widget._no) - 1]["time_stamp"]
  //                     ["beforeBed"] = value;
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
