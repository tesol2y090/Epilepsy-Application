import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:epilepsy/views/calendar/components/add_calendar.dart';
import 'package:epilepsy/views/calendar/components/detail_card.dart';

class DetailListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chuckCard = Hive.box('appDb');
    return Container(
      child: Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(bottom: 36),
              itemCount: chuckCard.length,
              itemBuilder: (context, index) {
                final card = chuckCard.get(index);
                return Column(children: [
                  DetailCard(card.type, card.epilepsyType, card.chuckTime,
                      card.detail, card.location),
                  chuckCard.length - 1 == index
                      ? FloatingActionButton(
                          backgroundColor: Colors.purple,
                          child: Icon(Icons.add),
                          foregroundColor: Colors.white,
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (_) => AddCalendar())),
                        )
                      : Row()
                ]);
              })),
    );
  }
}
