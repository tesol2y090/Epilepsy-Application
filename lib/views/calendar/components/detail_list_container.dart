import 'package:flutter/material.dart';

import 'package:epilepsy/views/calendar/components/add_calendar.dart';
import 'package:epilepsy/views/calendar/components/detail_card.dart';

class DetailListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          padding: EdgeInsets.only(bottom: 36),
          children: [
            DetailCard(),
            DetailCard(),
            DetailCard(),
            FloatingActionButton(
              backgroundColor: Colors.purple,
              child: Icon(Icons.add),
              foregroundColor: Colors.white,
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddCalendar())),
            )
          ],
        ),
      ),
    );
  }
}
