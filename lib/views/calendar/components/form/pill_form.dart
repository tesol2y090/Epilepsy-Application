import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/models/calendar/ChuckCard.dart';

class PillForm extends StatefulWidget {
  @override
  _PillFormState createState() => _PillFormState();
}

class _PillFormState extends State<PillForm> {
  final _formKey = GlobalKey<FormState>();

  String _time;
  String _detail;
  String _location;

  void addCalendarCard(ChuckCard newCard) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final chuckBox = Hive.box('chuck_data');
    if (chuckBox.get(formattedDate) == null) {
      chuckBox.put(formattedDate, []);
    }
    List<dynamic> data = chuckBox.get(formattedDate);
    data.add(newCard);
    chuckBox.put(formattedDate, data);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(24),
      child: ListView(children: [
        Column(
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
            Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 24),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'ระยะเวลาในการชัก'),
                        keyboardType: TextInputType.number,
                        onSaved: (value) => _time = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'โปรดกรอกอาการ'),
                        keyboardType: TextInputType.text,
                        onSaved: (value) => _detail = value,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'โปรดกรอกสถานที่'),
                        keyboardType: TextInputType.text,
                        onSaved: (value) => _location = value,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Row(
                          children: [
                            Expanded(
                                child: RaisedButton(
                              onPressed: () {
                                _formKey.currentState.save();
                                final newCard = new ChuckCard("pill", "แพ้ยา",
                                    _time, _detail, _location, DateTime.now());
                                addCalendarCard(newCard);
                              },
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
                ))
          ],
        ),
        ]),
    );
  }
}
