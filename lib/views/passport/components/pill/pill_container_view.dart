import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:epilepsy/views/passport/components/pill/pill_deatail_container.dart';

class PillContainerView extends StatefulWidget {
  final String _no;
  final String _name;
  final String _dose;
  final String _freq_side_effect;
  final String _danger_side_effect;
  final String _allergy;
  final String _image;

  const PillContainerView(
      this._no,
      this._name,
      this._dose,
      this._freq_side_effect,
      this._danger_side_effect, this._allergy, this._image,
      {Key key})
      : super(key: key);

  @override
  _PillContainerViewState createState() => _PillContainerViewState();
}

class _PillContainerViewState extends State<PillContainerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.grey[100],
        body: body());
  }

  Widget body() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 48),
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
                      widget._name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: ClipOval(
                        child: Image.asset(
                          widget._image,
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
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Column(
                children: [
                  PillDetailContainer(
                    widget._no,
                      widget._name,
                      widget._dose,
                      widget._freq_side_effect,
                      widget._danger_side_effect,
                      widget._allergy,
                      widget._image)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/images/back.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
