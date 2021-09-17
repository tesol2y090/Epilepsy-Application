import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserDetailNoti extends StatefulWidget {
  const UserDetailNoti({Key key}) : super(key: key);

  @override
  _UserDetailNotiState createState() => _UserDetailNotiState();
}

class _UserDetailNotiState extends State<UserDetailNoti> {
  bool _afterBreakNoti;
  bool _afterLunchNoti;
  bool _afterEvenNoti;
  bool _beforeBedNoti;

  @override
  Widget build(BuildContext context) {
    final userDataBox = Hive.box('user_data');
    bool afterBreakNoti = userDataBox.get('afterBreakNoti');
    bool afterLunchNoti = userDataBox.get('afterLunchNoti');
    bool afterEvenNoti = userDataBox.get('afterEvenNoti');
    bool beforeBedNoti = userDataBox.get('beforeBedNoti');
    setState(() {
      _afterBreakNoti = afterBreakNoti != null ? afterBreakNoti : false;
      _afterLunchNoti = afterLunchNoti != null ? afterLunchNoti : false;
      _afterEvenNoti = afterEvenNoti != null ? afterEvenNoti : false;
      _beforeBedNoti = beforeBedNoti != null ? beforeBedNoti : false;
    });
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
                value: _afterBreakNoti,
                onChanged: (bool value) {
                  setState(() {
                    _afterBreakNoti = value;
                    userDataBox.put("afterBreakNoti", _afterBreakNoti);
                  });
                },
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
                value: _afterLunchNoti,
                onChanged: (bool value) {
                  setState(() {
                    _afterLunchNoti = value;
                    userDataBox.put("afterLunchNoti", _afterLunchNoti);
                  });
                },
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
                value: _afterEvenNoti,
                onChanged: (bool value) {
                  setState(() {
                    _afterEvenNoti = value;
                    userDataBox.put("afterEvenNoti", _afterEvenNoti);
                  });
                },
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
                value: _beforeBedNoti,
                onChanged: (bool value) {
                  setState(() {
                    _beforeBedNoti = value;
                    userDataBox.put("beforeBedNoti", _beforeBedNoti);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
