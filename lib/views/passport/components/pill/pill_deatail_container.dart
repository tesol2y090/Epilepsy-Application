import 'package:flutter/material.dart';

import 'package:epilepsy/views/passport/components/pill/pill_detail_data.dart';
import 'package:epilepsy/views/passport/components/pill/pill_detail_stamp.dart';

class PillDetailContainer extends StatefulWidget {
  @override
  _PillDetailContainer createState() => _PillDetailContainer();
}

class _PillDetailContainer extends State<PillDetailContainer> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    PillDetailData(),
    PillDetailStamp()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {onItemTapped(0)},
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedIndex == 0 ? Colors.grey[100] : null,
                  ),
                  child: Text(
                    "ข้อมูลยาเบื้องต้น",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {onItemTapped(1)},
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedIndex == 1 ? Colors.grey[100] : null,
                  ),
                  child: Text(
                    "ลงเวลากินยา",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
          _widgetOptions.elementAt(selectedIndex)
        ],
      ),
    );
  }
}
