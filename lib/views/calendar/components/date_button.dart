import 'package:flutter/material.dart';

class DateButton extends StatelessWidget {
  final String _date;
  final int _numDate;
  final bool _isSelected;

  const DateButton(this._date, this._numDate, this._isSelected, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _isSelected ? Colors.purple : null,
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(4, 8, 4, 8),
          child: Column(
            children: [
              Text(
                "$_date",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Text(
                "$_numDate",
                style: TextStyle(
                    color: _isSelected ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
