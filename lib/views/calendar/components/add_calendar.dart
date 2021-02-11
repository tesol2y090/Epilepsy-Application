import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:epilepsy/models/calendar/EpilepsyTypeItem.dart';
import 'package:epilepsy/models/calendar/EpilepsyCard.dart';

class AddCalendar extends StatefulWidget {
  @override
  _AddCalendarState createState() => _AddCalendarState();
}

class _AddCalendarState extends State<AddCalendar> {
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

  void addCalendarCard() async {
    var box = await Hive.openBox('testBox');
    DateTime now = DateTime.now();
    var data = EpilepsyCard("test", 'test', 'test', 'test', now);
    box.put('testkey1', data);
    print(box.get('testkey1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.grey[100],
        body: body());
  }

  Widget body() {
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
                "เพิ่มอาการ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
          Container(
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
                        onPressed: () {
                          addCalendarCard();
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
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/images/back.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
