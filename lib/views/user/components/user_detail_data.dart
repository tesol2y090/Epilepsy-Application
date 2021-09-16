import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserDetailData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userDataBox = Hive.box('user_data');
    String no = userDataBox.get('no');
    String name = userDataBox.get('name');
    String birthDate = userDataBox.get('birth_date');
    String age = userDataBox.get('age');
    String gender = userDataBox.get('gender');
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(
                  "ข้อมูลเบื้องต้น",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "HN.",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "$no",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ชื่อ :",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "$name",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "วันเกิด :",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "$birthDate",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "อายุ :",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "$age",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "เพศ :",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "$gender",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
