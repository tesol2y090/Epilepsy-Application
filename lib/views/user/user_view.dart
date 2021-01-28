import 'package:flutter/material.dart';

import 'package:epilepsy/views/user/components/user_deatail_container.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(0, 98, 0, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'เด็กชายกันตภัทร จันทร์เกษม',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/profile-001.jpg',
                          width: 96,
                          height: 96,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Column(
                children: [UserDetailContainer()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
