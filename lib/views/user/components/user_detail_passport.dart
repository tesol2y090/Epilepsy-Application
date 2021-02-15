import 'package:flutter/material.dart';

class UserDetailPassport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.all(42),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(
                  "ประวัติการกินยา",
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
                "รหัส",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "00000001",
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
                "กันตภัทร จันทร์เกษม",
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
                "13 กันยายน 2541",
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
                "22",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
