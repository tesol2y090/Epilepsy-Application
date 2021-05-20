import 'package:flutter/material.dart';

class PillDetailData extends StatelessWidget {
  final String _name;
  final String _dose;
  final String _freq_side_effect;
  final String _danger_side_effect;
  final String _allergy;
  final String _image;

  const PillDetailData(this._name, this._dose, this._freq_side_effect,
      this._danger_side_effect, this._allergy, this._image,
      {Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      padding: EdgeInsets.all(42),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Text(
                  "ข้อมูลเบื้องต้น",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ชื่อยา",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "$_name",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ขนาด :",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "$_dose",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ผลข้างเคียงที่พบบ่อย",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "$_freq_side_effect",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ผลข้างเคียงที่ต้องระวัง",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "$_danger_side_effect",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "การแพ้ยา",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "$_allergy",
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
