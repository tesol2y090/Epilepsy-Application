import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';
import 'package:epilepsy/views/calendar/components/detail_list_container.dart';
import 'package:epilepsy/views/calendar/components/date_button.dart';
class CalendarView extends StatefulWidget {
  const CalendarView({ Key key }) : super(key: key);

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {

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


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
    List<String> dateSplit = formattedDate.split("-");
    List<String> monthList = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];
    String year = dateSplit[0];
    String month = monthList[int.parse(dateSplit[1]) - 1];
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(0, 98, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: ListTile(
                  title: Text(
                    '$month $year',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.purple,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Column(
                children: [
                  SelectDateContainer(_showDate),
                  DetailListContainer(_selectedDate),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
