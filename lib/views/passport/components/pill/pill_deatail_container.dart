import 'package:flutter/material.dart';

import 'package:epilepsy/views/passport/components/pill/pill_detail_data.dart';
import 'package:epilepsy/views/passport/components/pill/pill_detail_stamp.dart';

class PillDetailContainer extends StatefulWidget {
  final String _no;
  final String _name;
  final String _dose;
  final String _freq_side_effect;
  final String _danger_side_effect;
  final String _allergy;
  final String _image;

  const PillDetailContainer(
      this._no,
      this._name,
      this._dose,
      this._freq_side_effect,
      this._danger_side_effect, this._allergy, this._image,
      {Key key})
      : super(key: key);
  @override
  _PillDetailContainer createState() => _PillDetailContainer();
}

class _PillDetailContainer extends State<PillDetailContainer> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {onItemTapped(0)},
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedIndex == 0 ? Colors.grey[100] : null,
                  ),
                  child: Text(
                    "ข้อมูลยาเบื้องต้น",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {onItemTapped(1)},
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedIndex == 1 ? Colors.grey[100] : null,
                  ),
                  child: Text(
                    "ลงเวลากินยา",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
          selectedIndex == 0
              ? PillDetailData(
                  widget._name,
                  widget._dose,
                  widget._freq_side_effect,
                  widget._danger_side_effect,
                  widget._allergy,
                  widget._image)
              : PillDetailStamp(widget._no)
          // _widgetOptions.elementAt(selectedIndex)
        ],
      ),
    );
  }
}
