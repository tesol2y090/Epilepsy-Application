import 'package:flutter/material.dart';

import 'package:epilepsy/views/passport/components/pill/pill_container_view.dart';

class PassportCardView extends StatelessWidget {
  final String _name;
  final String _dose;
  final String _freq_side_effect;
  final String _danger_side_effect;
  final String _allergy;
  final String _image;

  const PassportCardView(this._name, this._dose, this._freq_side_effect,
      this._danger_side_effect, this._allergy, this._image,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => PillContainerView(_name, _dose, _freq_side_effect,
                  _danger_side_effect, _allergy, _image))),
      child: Container(
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
                        Text("$_name",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.purple,
                            )),
                        Text("$_dose", style: TextStyle(fontSize: 12))
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
