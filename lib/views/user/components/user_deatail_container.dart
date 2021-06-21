import 'package:flutter/material.dart';

import 'package:epilepsy/views/user/components/user_detail_data.dart';
import 'package:epilepsy/views/user/components/user_detail_chuck.dart';
import 'package:epilepsy/views/user/components/user_detail_passport.dart';

class UserDetailContainer extends StatefulWidget {
  @override
  _UserDetailContainerState createState() => _UserDetailContainerState();
}

class _UserDetailContainerState extends State<UserDetailContainer> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    UserDetailData(),
    UserDetailChuck(),
    UserDetailPassport()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
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
                    "ข้อมูลส่วนตัว",
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
                    "ประวัติการชัก",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {onItemTapped(2)},
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedIndex == 2 ? Colors.grey[100] : null,
                  ),
                  child: Text(
                    "ไดอารี่การกินยา",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              )
            ],
          ),
          _widgetOptions.elementAt(selectedIndex)
        ],
      ),
    );
  }
}
