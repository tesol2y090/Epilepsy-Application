import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';
import 'package:epilepsy/views/calendar/components/date_button.dart';
import 'package:epilepsy/models/passport/TimeStamp.dart';
import 'package:epilepsy/models/passport/PillCard.dart';

class PillDetailStamp extends StatefulWidget {
  final String _no;
  const PillDetailStamp(this._no);
  @override
  _PillDetailStampState createState() => _PillDetailStampState();
}

class _PillDetailStampState extends State<PillDetailStamp> {
  final _formKey = GlobalKey<FormState>();
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

  String afterBreak = "";
  String afterLunch = "";
  String afterEven = "";
  String beforeBed = "";

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
    String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final pillBox = Hive.box('pill_data');
    if (pillBox.get(formattedDate) == null) {
      pillBox.put(formattedDate, initPillDatas);
    }
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
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(top: 24),
        height: 200,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "หลังอาหารเช้า",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  key: Key(afterBreak.toString()+"break"),
                  initialValue: afterBreak,
                  decoration: InputDecoration(labelText: 'ปริมาณยา'),
                  keyboardType: TextInputType.text,
                  onSaved: (value) => afterBreak = value,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "หลังอาหารกลางวัน",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  key: Key(afterLunch.toString()+"lunch"),
                  initialValue: afterLunch,
                  decoration: InputDecoration(labelText: 'ปริมาณยา'),
                  keyboardType: TextInputType.text,
                  onSaved: (value) => afterLunch = value,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "หลังอาหารเย็น",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  key: Key(afterEven.toString()+"even"),
                  initialValue: afterEven,
                  decoration: InputDecoration(labelText: 'ปริมาณยา'),
                  keyboardType: TextInputType.text,
                  onSaved: (value) => afterEven = value,
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              child: Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "ก่อนนอน",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  key: Key(beforeBed.toString()+"bed"),
                  initialValue: beforeBed,
                  decoration: InputDecoration(labelText: 'ปริมาณยา'),
                  keyboardType: TextInputType.text,
                  onSaved: (value) => beforeBed = value,
                ),
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Row(
              children: [
                Expanded(
                    child: RaisedButton(
                  onPressed: () {
                    _formKey.currentState.save();
                    pillDatas[int.parse(widget._no) - 1].timeStamp.afterBreak =
                        afterBreak;
                    pillDatas[int.parse(widget._no) - 1].timeStamp.afterLunch =
                        afterLunch;
                    pillDatas[int.parse(widget._no) - 1].timeStamp.afterEven =
                        afterEven;
                    pillDatas[int.parse(widget._no) - 1].timeStamp.beforeBed =
                        beforeBed;
                    pillBox.put(formattedDate, pillDatas);
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(12),
                  color: Colors.purple,
                  child: Container(
                    child: const Text('Save', style: TextStyle(fontSize: 20)),
                  ),
                ))
              ],
            ),
          )
        ]),
      ),
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
