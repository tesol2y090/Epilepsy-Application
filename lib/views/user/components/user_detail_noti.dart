import 'package:flutter/material.dart';

class UserDetailNoti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
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
                  "ตั้งเวลาเตือนการกินยา",
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
                "ตั้งเวลาเตือน 7.30",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.purple,
                value: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ตั้งเวลาเตือน 11.30",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.purple,
                value: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ตั้งเวลาเตือน 17.30",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.purple,
                value: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "ตั้งเวลาเตือน 21.30",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.purple,
                value: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
