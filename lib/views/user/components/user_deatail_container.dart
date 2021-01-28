import 'package:flutter/material.dart';

import 'package:epilepsy/views/user/components/user_detail_data.dart';

class UserDetailContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[100],
                ),
                child: Text(
                  "ข้อมูลส่วนตัว",
                  style: TextStyle(fontSize: 14, color: Colors.purple),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Colors.grey[100],
                ),
                child: Text(
                  "ประวัติการชัก",
                  style: TextStyle(fontSize: 14, color: Colors.purple),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Colors.grey[100],
                ),
                child: Text(
                  "ไดอารี่การกินยา",
                  style: TextStyle(fontSize: 14, color: Colors.purple),
                ),
              )
            ],
          ),
          UserDetailData()
        ],
      ),
    );
  }
}
