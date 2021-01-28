import 'package:flutter/material.dart';

class PassportCardView extends StatelessWidget {
  final String _header;
  final String _detail;
  final String _image;

  const PassportCardView(this._header, this._detail, this._image, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          margin: EdgeInsets.fromLTRB(28, 0, 48, 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    '$_image',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$_header",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.purple,
                          )),
                      Text("$_detail", style: TextStyle(fontSize: 12))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
