import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:epilepsy/views/user/components/user_deatail_container.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _no;
  String _birthDate;
  String _age;
  String _gender;

  void addCalendarCard(no, name, birthDate, age, gender) {
    final userBox = Hive.box('user_data');
    userBox.put("no", no);
    userBox.put("name", name);
    userBox.put("birth_date", birthDate);
    userBox.put("age", age);
    userBox.put("gender", gender);
    setState(() {
      _name = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userDataBox = Hive.box('user_data');
    String name = userDataBox.get('name');
    setState(() {
      _name = name;
    });
    return _name == null
        ? Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(24),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        "ลงทะเบียนข้อมูล",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      )
                    ],
                  ),
                  Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(top: 24),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: 'รหัส'),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _no = value,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'ชื่อ - นามสกุล'),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _name = value,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'วันเกิด'),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _birthDate = value,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'อายุ'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) => _age = value,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'เพศ'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) => _gender = value,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: RaisedButton(
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      addCalendarCard(_no, _name, _birthDate,
                                          _age, _gender);
                                    },
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(12),
                                    color: Colors.purple,
                                    child: Container(
                                      child: const Text('Save',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ]),
          )
        : Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(0, 98, 0, 0),
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
                            '$_name',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 24),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/profile-001.png',
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
                    margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
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
