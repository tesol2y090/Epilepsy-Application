import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import 'package:epilepsy/views/user/components/user_deatail_container.dart';
import 'package:permission_handler/permission_handler.dart';

class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final _formKey = GlobalKey<FormState>();

  String _image;
  bool _isEdit = false;

  String _name;
  String _no;
  String _birthDate;
  String _age;
  String _gender;

  void setIsEdit() {
    setState(() {
      _isEdit = !_isEdit;
    });
  }

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
    String no = userDataBox.get('no');
    String name = userDataBox.get('name');
    String birthDate = userDataBox.get('birth_date');
    String age = userDataBox.get('age');
    String gender = userDataBox.get('gender');
    String imgPath = userDataBox.get('img');
    setState(() {
      _name = name;
      _image = imgPath;
    });
    return name == null || _isEdit
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
                            Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 24),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final status =
                                            await Permission.photos.request();
                                        if (status ==
                                            PermissionStatus.granted) {
                                          var image =
                                              await ImagePicker.pickImage(
                                                  source: ImageSource.gallery);
                                          print(image);
                                          setState(() {
                                            _image = image.path;
                                          });
                                          userDataBox.put("img", _image);
                                        } else if (status ==
                                            PermissionStatus.denied) {
                                        } else if (status ==
                                            PermissionStatus
                                                .permanentlyDenied) {
                                          await openAppSettings();
                                        }
                                      },
                                      child: ClipOval(
                                        child: _image != null
                                            ? Image.file(
                                                File(_image),
                                                width: 96,
                                                height: 96,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                'assets/images/profile-001.png',
                                                width: 96,
                                                height: 96,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            TextFormField(
                              key: Key(no.toString() + "no"),
                              initialValue: no,
                              decoration: InputDecoration(labelText: 'HN'),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _no = value,
                            ),
                            TextFormField(
                              key: Key(name.toString() + "name"),
                              initialValue: name,
                              decoration:
                                  InputDecoration(labelText: 'ชื่อ - นามสกุล'),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _name = value,
                            ),
                            TextFormField(
                              key: Key(birthDate.toString() + "birthDate"),
                              initialValue: birthDate,
                              decoration: InputDecoration(labelText: 'วันเกิด'),
                              keyboardType: TextInputType.text,
                              onSaved: (value) => _birthDate = value,
                            ),
                            TextFormField(
                              key: Key(age.toString() + "age"),
                              initialValue: age,
                              decoration: InputDecoration(labelText: 'อายุ'),
                              keyboardType: TextInputType.number,
                              onSaved: (value) => _age = value,
                            ),
                            TextFormField(
                              key: Key(gender.toString() + "gender"),
                              initialValue: gender,
                              decoration: InputDecoration(labelText: 'เพศ'),
                              keyboardType: TextInputType.text,
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
                                      setState(() {
                                        _isEdit = false;
                                      });
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
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: GestureDetector(
                            onTap: setIsEdit,
                            child: Text(
                              "แก้ไข",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
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
                              child: imgPath != null
                                  ? Image.file(
                                      File(imgPath),
                                      width: 96,
                                      height: 96,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
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
