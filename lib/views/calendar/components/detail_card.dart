import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailCard extends StatelessWidget {
  final String _type;
  final String _epilepsyType;
  final String _chuckTime;
  final String _detail;
  final String _location;
  final DateTime _dateTime;

  const DetailCard(this._type, this._epilepsyType, this._chuckTime,
      this._detail, this._location, this._dateTime,
      {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('hh::mm a').format(_dateTime);
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 22,
                height: 8,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: this._type == "chuck" ? Colors.purple : Colors.green,
                ),
              ),
              Text(
                '$_chuckTime',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 16, 24, 30),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[350], width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      this._type == "chuck"
                                ? this._epilepsyType
                                : "แพ้ยา",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      child: Text(
                        "- $_detail",
                        style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.grey[400],
                          ),
                          Text(
                            this._location,
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
