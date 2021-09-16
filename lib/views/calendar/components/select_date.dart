import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDateContainer extends StatefulWidget {
  List<GestureDetector> _showDate;
  SelectDateContainer(this._showDate, {Key key}) : super(key: key);

  @override
  _SelectDateContainerState createState() => _SelectDateContainerState();
}

class _SelectDateContainerState extends State<SelectDateContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget._showDate,
      ),
    );
  }
}
