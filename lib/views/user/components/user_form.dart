import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class AddUserForm extends StatefulWidget {
  @override
  _AddUserFormState createState() => _AddUserFormState();
}

class _AddUserFormState extends State<AddUserForm> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _no;
  String _birthDate;
  String _age;
  String _gender;

  void addCalendarCard(no, name, birthDate, age, gender) {
    final userBox = Hive.box('chuck_data');
    userBox.put("no", no);
    userBox.put("name", name);
    userBox.put("birth_date", birthDate);
    userBox.put("age", age);
    userBox.put("gender", gender);
  }

  @override
  Widget build(BuildContext context) {
    return;
  }
}
