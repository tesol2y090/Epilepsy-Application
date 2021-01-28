import 'package:flutter/material.dart';

import 'package:epilepsy/views/calendar/components/date_button.dart';

class SelectDateContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DateButton('Fri', '22', false),
          DateButton('Sat', '23', false),
          DateButton('Sun', '24', false),
          DateButton('Mon', '25', true),
          DateButton('Tue', '26', false),
          DateButton('Wed', '27', false),
          DateButton('Thr', '28', false)
        ],
      ),
    );
  }
}
