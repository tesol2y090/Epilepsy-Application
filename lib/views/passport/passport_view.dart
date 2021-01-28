import 'package:flutter/material.dart';

import 'package:epilepsy/views/passport/components/passport_card_view.dart';

class PassportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(0, 98, 0, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  'ไดอารี่การกินยา',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Container(
                child: Expanded(
                  child: ListView(
                    children: [
                      PassportCardView(
                          'ยาแก้อาการชัก',
                          'ควรกินก่อนเวลา 12.00 ของทุกวัน',
                          'assets/images/drug-pill.jpg'),
                      PassportCardView(
                          'ยาแก้อาการชัก',
                          'ควรกินก่อนเวลา 12.00 ของทุกวัน',
                          'assets/images/drug-pill.jpg'),
                      PassportCardView(
                          'ยาแก้อาการชัก',
                          'ควรกินก่อนเวลา 12.00 ของทุกวัน',
                          'assets/images/drug-pill.jpg'),
                      FloatingActionButton(
                        backgroundColor: Colors.purple,
                        child: Icon(Icons.add),
                        foregroundColor: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
