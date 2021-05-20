import 'package:flutter/material.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';

class PillDetailStamp extends StatefulWidget {
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
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.fromLTRB(42, 0, 42, 42),
      child: Column(
        children: [
          Column(
            children: [SelectDateContainer(), checkList()],
          )
        ],
      ),
    );
  }

  Widget checkList() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(children: [
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "ก่อนอาหารเช้า",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.beforeBreak,
              onChanged: (bool value) {
                setState(() {
                  this.beforeBreak = value;
                });
              },
            ),
          ]),
        ),
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
                });
              },
            ),
          ]),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "ก่อนอาหารกลางวัน",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.beforeLunch,
              onChanged: (bool value) {
                setState(() {
                  this.beforeLunch = value;
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
                });
              },
            ),
          ]),
        ),
        Container(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "ก่อนอาหารเย็น",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.purple,
              value: this.beforeEven,
              onChanged: (bool value) {
                setState(() {
                  this.beforeEven = value;
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
                });
              },
            ),
          ]),
        ),
      ]),
    );
  }
}
