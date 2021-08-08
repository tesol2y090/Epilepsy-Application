import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/date_button.dart';

class SelectDateContainer extends StatelessWidget {
  static DateTime now = DateTime.now();
  static DateTime date1 = now.subtract(Duration(days: 3));
  static DateTime date2 = now.subtract(Duration(days: 2));
  static DateTime date3 = now.subtract(Duration(days: 1));
  static DateTime date4 = now.subtract(Duration());
  static DateTime date5 = now.add(Duration(days: 1));
  static DateTime date6 = now.add(Duration(days: 2));
  static DateTime date7 = now.add(Duration(days: 3));
  static String formattedDate1 = DateFormat('dd').format(date1);
  static String formattedDate2 = DateFormat('dd').format(date2);
  static String formattedDate3 = DateFormat('dd').format(date3);
  static String formattedDate4 = DateFormat('dd').format(date4);
  static String formattedDate5 = DateFormat('dd').format(date5);
  static String formattedDate6 = DateFormat('dd').format(date6);
  static String formattedDate7 = DateFormat('dd').format(date7);
  static String formattedDateName1 = DateFormat('EEEE').format(date1);
  static String formattedDateName2 = DateFormat('EEEE').format(date2);
  static String formattedDateName3 = DateFormat('EEEE').format(date3);
  static String formattedDateName4 = DateFormat('EEEE').format(date4);
  static String formattedDateName5 = DateFormat('EEEE').format(date5);
  static String formattedDateName6 = DateFormat('EEEE').format(date6);
  static String formattedDateName7 = DateFormat('EEEE').format(date7);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateButton(formattedDateName1.substring(0,3), int.parse(formattedDate1), false),
          DateButton(formattedDateName2.substring(0,3), int.parse(formattedDate2), false),
          DateButton(formattedDateName3.substring(0,3), int.parse(formattedDate3), false),
          DateButton(formattedDateName4.substring(0,3), int.parse(formattedDate4), true),
          DateButton(formattedDateName5.substring(0,3), int.parse(formattedDate5), false),
          DateButton(formattedDateName6.substring(0,3), int.parse(formattedDate6), false),
          DateButton(formattedDateName7.substring(0,3), int.parse(formattedDate7), false)
        ],
      ),
    );
  }
}
