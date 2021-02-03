import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/date_button.dart';

class SelectDateContainer extends StatelessWidget {
  static DateTime now = DateTime.now();
  static String formattedDate = DateFormat('EEE, yyyy-MM-dd').format(now);
  static List<String> dateSplit = formattedDate.split("-");
  static String dateName = dateSplit[0];
  static int date = int.parse(dateSplit[2]);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateButton('Fri', date - 3, false),
          DateButton('Sat', date - 2, false),
          DateButton('Sun', date - 1, false),
          DateButton('Mon', date, true),
          DateButton('Tue', date + 1, false),
          DateButton('Wed', date + 2, false),
          DateButton('Thr', date + 3, false)
        ],
      ),
    );
  }
}
