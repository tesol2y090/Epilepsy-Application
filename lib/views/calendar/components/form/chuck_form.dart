import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/models/calendar/EpilepsyTypeItem.dart';
import 'package:epilepsy/models/calendar/ChuckCard.dart';

class ChuckForm extends StatefulWidget {
  @override
  _ChuckFormState createState() => _ChuckFormState();
}

class _ChuckFormState extends State<ChuckForm> {
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

  List<EpilepsyTypeItem> _dropdownItems = [
    EpilepsyTypeItem(1, "ชักทั้งตัว"),
    EpilepsyTypeItem(2, "ชักเฉพาะส่วน"),
    EpilepsyTypeItem(3, "เหม่อลอย"),
    EpilepsyTypeItem(4, "อื่นๆ")
  ];

  List<DropdownMenuItem<EpilepsyTypeItem>> _dropdownMenuItems;
  EpilepsyTypeItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<EpilepsyTypeItem>> buildDropDownMenuItems(
      List listItems) {
    List<DropdownMenuItem<EpilepsyTypeItem>> items = List();
    for (EpilepsyTypeItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
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
                  "เพิ่มอาการชัก",
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
                      Row(
                        children: [
                          Expanded(
                              child: DropdownButton<EpilepsyTypeItem>(
                                  value: _selectedItem,
                                  items: _dropdownMenuItems,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedItem = value;
                                    });
                                  })),
                        ],
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: 'โปรดกรอกชื่อยา'),
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
                                final newCard = new ChuckCard(
                                    "chuck",
                                    _selectedItem.name,
                                    _time,
                                    _detail,
                                    _location,
                                    DateTime.now());
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
