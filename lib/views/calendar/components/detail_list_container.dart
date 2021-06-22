import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/add_calendar.dart';
import 'package:epilepsy/views/calendar/components/detail_card.dart';

class DetailListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final chuckCard = Hive.box('chuck_data');
    List<dynamic> data = chuckCard.get(formattedDate);
    return Container(
      child: Expanded(
          child: data != null
              ? ListView.builder(
                  padding: EdgeInsets.only(bottom: 36),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final card = data[index];
                    return Column(children: [
                      DetailCard(card.type, card.epilepsyType, card.chuckTime,
                          card.detail, card.location),
                      data.length - 1 == index
                          ? FloatingActionButton(
                              backgroundColor: Colors.purple,
                              child: Icon(Icons.add),
                              foregroundColor: Colors.white,
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AddCalendar())),
                            )
                          : Row()
                    ]);
                  })
              : FloatingActionButton(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.add),
                  foregroundColor: Colors.white,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddCalendar())),
                )),
    );
  }
}
