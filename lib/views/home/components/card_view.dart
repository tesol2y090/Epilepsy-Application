import 'package:flutter/material.dart';

class CardHomeView extends StatelessWidget {
  final String _header;
  final String _detail;
  final String _image;
  // final Widget _widget;

  const CardHomeView(this._header, this._detail, this._image, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // onTap: () =>
        //     Navigator.push(context, MaterialPageRoute(builder: (_) => _widget)),
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Image.asset('$_image'),
          ListTile(
            title: Text('$_header',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.purple)),
            subtitle: Text('$_detail'),
          ),
        ],
      ),
    ));
  }
}
