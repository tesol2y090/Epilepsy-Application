import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:epilepsy/views/calendar/components/edit/edit_chuck_form.dart';
import 'package:epilepsy/views/calendar/components/edit/edit_pill_form.dart';

class EditCalendar extends StatefulWidget {
  final String _type;
  final String _epilepsyType;
  final String _chuckTime;
  final String _detail;
  final String _location;
  final DateTime _dateTime;
  DateTime _selectedDate;
  Function _increseTick;
  EditCalendar(this._type, this._epilepsyType, this._chuckTime, this._detail,
      this._location, this._dateTime, this._selectedDate, this._increseTick,
      {Key key})
      : super(key: key);
  @override
  _EditCalendarState createState() => _EditCalendarState();
}

class _EditCalendarState extends State<EditCalendar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: Colors.grey[100],
            body: body()));
  }

  Widget body() {
    return TabBarView(children: [
      widget._type == "chuck"
          ? EditChuckForm(
              widget._type,
              widget._epilepsyType,
              widget._chuckTime,
              widget._detail,
              widget._location,
              widget._dateTime,
              widget._selectedDate,
              widget._increseTick)
          : EditPillForm(
              widget._type,
              widget._epilepsyType,
              widget._chuckTime,
              widget._detail,
              widget._location,
              widget._dateTime,
              widget._selectedDate,
              widget._increseTick),
    ]);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      bottom: TabBar(
        tabs: [
          Tab(
            child: Text(
                widget._type == 'chuck' ? "ข้อมูลการชัก" : "ข้อมูลการแพ้ยา",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/images/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
