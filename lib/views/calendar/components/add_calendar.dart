import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:epilepsy/views/calendar/components/form/chuck_form.dart';
import 'package:epilepsy/views/calendar/components/form/pill_form.dart';

class AddCalendar extends StatefulWidget {
  @override
  _AddCalendarState createState() => _AddCalendarState();
}

class _AddCalendarState extends State<AddCalendar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: Colors.grey[100],
            body: body()));
  }

  Widget body() {
    return TabBarView(children: [ChuckForm(), PillForm()]);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      bottom: TabBar(
        tabs: [
          Tab(
            child: Text("อาการชัก",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Tab(
            child: Text("อาการแพ้ยา",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )
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
