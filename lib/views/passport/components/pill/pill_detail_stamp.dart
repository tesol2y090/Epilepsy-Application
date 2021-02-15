import 'package:flutter/material.dart';

import 'package:epilepsy/views/calendar/components/select_date.dart';

class PillDetailStamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.fromLTRB(42, 0, 42, 42),
      child: Column(
        children: [
          Column(
            children: [SelectDateContainer(), checkList()],
          )
        ],
      ),
    );
  }

  Widget checkList() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "ก่อนอาหารเช้า",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "22",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ]),
    );
  }
}
