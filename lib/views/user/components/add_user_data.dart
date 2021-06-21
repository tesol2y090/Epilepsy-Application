import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:epilepsy/views/user/components/user_form.dart';

class AddUserData extends StatefulWidget {
  @override
  _AddUserDataState createState() => _AddUserDataState();
}

class _AddUserDataState extends State<AddUserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.grey[100],
        body: AddUserForm());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.purple,
      elevation: 0,
      bottom: TabBar(
        tabs: [
          Tab(
            child: Text("ลงทะเบียน",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/images/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
