import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/models/calendar/EpilepsyTypeItem.dart';
import 'package:epilepsy/models/calendar/ChuckCard.dart';

class EditPillForm extends StatefulWidget {
  final String _type;
  final String _epilepsyType;
  final String _chuckTime;
  final String _detail;
  final String _location;
  final DateTime _dateTime;
  DateTime _selectedDate;
  final _increseTick;
  EditPillForm(this._type, this._epilepsyType, this._chuckTime, this._detail,
      this._location, this._dateTime, this._selectedDate, this._increseTick,
      {Key key})
      : super(key: key);
  @override
  _EditPillFormState createState() => _EditPillFormState();
}

class _EditPillFormState extends State<EditPillForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _timeController = TextEditingController();

  String _time;
  String _detail;
  String _location;

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
    String initHour = widget._chuckTime.split(":")[0];
    String initMinute = widget._chuckTime.split(":")[1];
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _dropdownHourItems = buildDropdownMenuTime(_dropdownHours);
    _dropdownMinuteItems = buildDropdownMenuTime(_dropdownMinutes);
    _selectedItem = widget._location;
    _selectedHour = initHour;
    _selectedMinute = initMinute;
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

  void editCalendarCard() {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(widget._selectedDate);
    final chuckBox = Hive.box('chuck_data');
    if (chuckBox.get(formattedDate) == null) {
      chuckBox.put(formattedDate, []);
    }
    var data = new List<dynamic>.from(chuckBox.get(formattedDate));
    int editCardIndex;
    dynamic findChuckCard(DateTime _dateTime) {
      for (var i = 0; i < data.length; i++) {
        var tempPill = data[i];
        if (tempPill.timestamp == _dateTime) {
          editCardIndex = i;
          return data[i];
        }
      }
      return data[0];
    }

    ChuckCard editCard = findChuckCard(widget._dateTime);
    editCard.location = _selectedItem;
    editCard.detail = _detail;
    editCard.chuckTime = "$_selectedHour:$_selectedMinute";
    data[editCardIndex] = editCard;
    chuckBox.put(formattedDate, data);
    widget._increseTick();
    Navigator.pop(context);
  }

  void deleteCalendarCard() {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(widget._selectedDate);
    final chuckBox = Hive.box('chuck_data');
    if (chuckBox.get(formattedDate) == null) {
      chuckBox.put(formattedDate, []);
    }
    var data = new List<dynamic>.from(chuckBox.get(formattedDate));
    data.removeWhere((card) => card.timestamp == widget._dateTime);

    chuckBox.put(formattedDate, data);
    widget._increseTick();
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
                  "แก้ไขอาการแพ้ยา",
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
                        key: Key(widget._detail.toString() + "no"),
                        initialValue: widget._detail,
                        decoration: InputDecoration(labelText: 'โปรดกรอกอาการ'),
                        keyboardType: TextInputType.text,
                        onSaved: (value) => _detail = value,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: RaisedButton(
                                  onPressed: () {
                                    _formKey.currentState.save();
                                    editCalendarCard();
                                  },
                                  textColor: Colors.white,
                                  padding: const EdgeInsets.all(12),
                                  color: Colors.purple,
                                  child: Container(
                                    child: const Text('Save',
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: RaisedButton(
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      deleteCalendarCard();
                                    },
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(12),
                                    color: Colors.red[400],
                                    child: Container(
                                      child: const Text('Delete',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  )),
                                ],
                              ),
                            ),
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
