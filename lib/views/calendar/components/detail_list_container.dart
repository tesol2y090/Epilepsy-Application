import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/add_calendar.dart';
import 'package:epilepsy/views/calendar/components/detail_card.dart';

class DetailListContainer extends StatelessWidget {
  final DateTime _date;
  // final Widget _widget;

  const DetailListContainer(this._date, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(_date);
    final chuckCard = Hive.box('chuck_data');
    if (chuckCard.get(formattedDate) == null) {
      chuckCard.put(formattedDate, []);
    }
    List<dynamic> data = chuckCard.get(formattedDate);
    return Container(
      child: Expanded(
          child: data.length != 0
              ? ListView.builder(
                  padding: EdgeInsets.only(bottom: 36),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final card = data[index];
                    return Column(children: [
                      DetailCard(card.type, card.epilepsyType, card.chuckTime,
                          card.detail, card.location, card.timestamp),
                      data.length - 1 == index
                          ? FloatingActionButton(
                              backgroundColor: Colors.purple,
                              child: Icon(Icons.add),
                              foregroundColor: Colors.white,
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AddCalendar(_date))),
                            )
                          : Row()
                    ]);
                  })
              : FloatingActionButton(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.add),
                  foregroundColor: Colors.white,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddCalendar(_date))),
                )),
    );
  }
}
