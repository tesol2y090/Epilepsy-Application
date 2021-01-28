import 'package:flutter/material.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';
import 'package:epilepsy/views/calendar/components/detail_list_container.dart';

class CalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    'มกราคม 2021',
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
                  SelectDateContainer(),
                  DetailListContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
