import 'package:flutter/material.dart';
import 'package:epilepsy/views/home/components/card_view.dart';

class HomeView extends StatelessWidget {
  final Widget _widget;

  const HomeView(this._widget, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(20, 48, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Image.asset(
                'assets/images/epilepsy-logo.png',
              ),
            ],
          ),
          Expanded(
              child: ListView(
            children: [
              CardHomeView(
                  'ความรู้เกี่ยวกับโรค',
                  'ความรู้ต่างๆ ทั้งการรักษา การดูแล เป็นต้น',
                  'assets/images/knowledge.jpg',
                  _widget),
              CardHomeView(
                  'บันทึกการชัก',
                  'จดบันทึกการชักรูปแบบต่างๆ ในแต่ละวัน',
                  'assets/images/calendar.jpg',
                  _widget),
              CardHomeView('ลงเวลากินยา', 'บักทึกการกินยาที่สำคัญในแต่ละวัน',
                  'assets/images/passport.jpg', _widget)
            ],
          ))
        ],
      ),
    );
  }
}
