import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/models/calendar/ChuckCard.dart';

class PillForm extends StatefulWidget {
  DateTime _selectedDate;
  PillForm(this._selectedDate, {Key key}) : super(key: key);
  @override
  _PillFormState createState() => _PillFormState();
}

class _PillFormState extends State<PillForm> {
  final _formKey = GlobalKey<FormState>();

  String _detail;
  String _location;

  void addCalendarCard(ChuckCard newCard) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(widget._selectedDate);
    final chuckBox = Hive.box('chuck_data');
    if (chuckBox.get(formattedDate) == null) {
      chuckBox.put(formattedDate, []);
    }
    var data = new List<dynamic>.from(chuckBox.get(formattedDate));
    data.add(newCard);
    chuckBox.put(formattedDate, data);
    Navigator.pop(context);
  }

  List<String> _dropdownItems = [
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
  List<String> _dropdownHours = [
    for (int i = 1; i < 25; i++)
      i.toString().length < 2 ? "0" + i.toString() : i.toString()
  ];
  List<String> _dropdownMinutes = [
    for (int i = 1; i < 60; i++)
      i.toString().length < 2 ? "0" + i.toString() : i.toString()
  ];

  List<DropdownMenuItem<String>> _dropdownMenuItems;
  List<DropdownMenuItem<String>> _dropdownHourItems;
  List<DropdownMenuItem<String>> _dropdownMinuteItems;
  String _selectedItem;
  String _selectedHour;
  String _selectedMinute;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _dropdownHourItems = buildDropdownMenuTime(_dropdownHours);
    _dropdownMinuteItems = buildDropdownMenuTime(_dropdownMinutes);
    _selectedItem = _dropdownMenuItems[0].value;
    _selectedHour = _dropdownHourItems[0].value;
    _selectedMinute = _dropdownMinuteItems[0].value;
  }

  List<DropdownMenuItem<String>> buildDropdownMenuTime(List listItems) {
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

  List<DropdownMenuItem<String>> buildDropDownMenuItems(
      List listItems) {
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
                      Row(
                        children: [
                          Expanded(
                              child: DropdownButton<String>(
                                  value: _selectedItem,
                                  items: _dropdownMenuItems,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedItem = value;
                                    });
                                  })),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "โปรดกรอกเวลา",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: DropdownButton<String>(
                                    value: _selectedHour,
                                    items: _dropdownHourItems,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedHour = value;
                                      });
                                    }),
                          ),
                                  DropdownButton<String>(
                                  value: _selectedMinute,
                                  items: _dropdownMinuteItems,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedMinute = value;
                                    });
                                  })
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'โปรดกรอกอาการ'),
                        keyboardType: TextInputType.text,
                        onSaved: (value) => _detail = value,
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
                                    "$_selectedHour:$_selectedMinute", _detail, _selectedItem, DateTime.now());
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
