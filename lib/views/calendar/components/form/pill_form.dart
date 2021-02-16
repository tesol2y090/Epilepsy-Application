import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:epilepsy/models/calendar/EpilepsyCard.dart';

class PillForm extends StatefulWidget {
  // void addCalendarCard() async {
  //   var box = await Hive.openBox('testBox');
  //   DateTime now = DateTime.now();
  //   var data = EpilepsyCard("test", 'test', 'test', 'test', now);
  //   box.put('testkey1', data);
  //   print(box.get('testkey1'));
  // }

  @override
  _PillFormState createState() => _PillFormState();
}

class _PillFormState extends State<PillForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                "เพิ่มอาการแพ้ยา",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'ระยะเวลาในการชัก'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'โปรดกรอกอาการ'),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'โปรดกรอกสถานที่'),
                  keyboardType: TextInputType.text,
                ),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                        // onPressed: () {
                        //   addCalendarCard();
                        // },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                        color: Colors.purple,
                        child: Container(
                          child: const Text('Save',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
