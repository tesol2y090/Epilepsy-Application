import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/calendar/components/add_calendar.dart';
import 'package:epilepsy/views/calendar/components/detail_card.dart';
import 'package:epilepsy/views/calendar/components/edit_calendar.dart';

class DetailListContainer extends StatefulWidget {
  final DateTime _date;

  const DetailListContainer(this._date, {Key key}) : super(key: key);

  @override
  _DetailListContainerState createState() => _DetailListContainerState();
}

class _DetailListContainerState extends State<DetailListContainer> {
  int _tick = 0;

  @override
  Widget build(BuildContext context) {
    void increment() {
      setState(() {
        _tick += 1;
      });
    }

    String formattedDate = DateFormat('yyyy-MM-dd').format(widget._date);
    final chuckCard = Hive.box('chuck_data');
    if (chuckCard.get(formattedDate) == null) {
      chuckCard.put(formattedDate, []);
    }
    print(_tick);
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
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditCalendar(
                                    card.type,
                                    card.epilepsyType,
                                    card.chuckTime,
                                    card.detail,
                                    card.location,
                                    card.timestamp,
                                    widget._date,
                                    increment))),
                        child: DetailCard(
                            card.type,
                            card.epilepsyType,
                            card.chuckTime,
                            card.detail,
                            card.location,
                            card.timestamp),
                      ),
                      data.length - 1 == index
                          ? FloatingActionButton(
                              backgroundColor: Colors.purple,
                              child: Icon(Icons.add),
                              foregroundColor: Colors.white,
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AddCalendar(
                                          widget._date, increment))),
                            )
                          : Row()
                    ]);
                  })
              : FloatingActionButton(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.add),
                  foregroundColor: Colors.white,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              AddCalendar(widget._date, increment))),
                )),
    );
  }
}
