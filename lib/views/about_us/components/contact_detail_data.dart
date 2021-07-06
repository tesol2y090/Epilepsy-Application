import 'package:flutter/material.dart';

class ContactDetailData extends StatelessWidget {
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
                  "ช่องทางการติดต่อ",
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
                "หน่วยงาน",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "หน่วยประสาทวิทยา",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "เบอร์โทร",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "098-523-3838",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "เว็บไซต์",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "http://www.pedceppmk.com/",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/line-id.png',
                width: 96,
                height: 96,
                fit: BoxFit.cover,
              ),
            ],
          )
        ],
      ),
    );
  }
}
