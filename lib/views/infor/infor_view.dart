import 'package:flutter/material.dart';

import 'package:epilepsy/views/infor/components/infor_card_view.dart';

class InforView extends StatelessWidget {
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
              InforCardView('โรคลมชักคืออะไร?', 'รู้จักโรคลมชักแบบตในแบบต่างๆ',
                  'assets/images/what_is_epilepsy.jpg'),
              InforCardView(
                  'สาเหตุของการชัก',
                  'เรียนรู้สาเหตุของการเกิดอาการในแบบต่างๆ',
                  'assets/images/cause-epilepsy.png'),
              InforCardView(
                  'ประเภทของอาการชัก',
                  'เรียนรู้ประเภทของการชักในแบบต่างๆ',
                  'assets/images/type_of_epilepsy.gif'),
              InforCardView(
                  'การรักษาโรคลมชัก',
                  'เรียนรู้การรักษาโรคลมชักในแบบต่างๆ',
                  'assets/images/rescure_of_epilepsy.jpg'),
              InforCardView(
                  'การพยาบาลผู้ป่วย',
                  'เรียนรู้การพยาบาลผู้ป่วยโรคลมชักเบื้องต้น',
                  'assets/images/basic-cpr.jpg'),
              InforCardView(
                  'การดูแลผู้ป่วย',
                  'เรียนรู้การดูแลผู้ป่วยในแบบต่างๆ อย่างถูกต้อง',
                  'assets/images/long-tem_rescue.jpg'),
            ],
          ))
        ],
      ),
    );
  }
}
