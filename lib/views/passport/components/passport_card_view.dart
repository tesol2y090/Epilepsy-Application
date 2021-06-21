import 'package:flutter/material.dart';

import 'package:epilepsy/views/passport/components/pill/pill_container_view.dart';

class PassportCardView extends StatelessWidget {
  final String _no;
  final String _name;
  final String _dose;
  final String _freq_side_effect;
  final String _danger_side_effect;
  final String _allergy;
  final String _image;

  const PassportCardView(
      this._no,
      this._name,
      this._dose,
      this._freq_side_effect,
      this._danger_side_effect, this._allergy, this._image,
      {Key key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => PillContainerView(_no, _name, _dose,
                  _freq_side_effect,
                  _danger_side_effect, _allergy, _image))),
      child: Container(
        child: Card(
      shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
      child: Column(
        children: [
          Image.asset('$_image'),
              ListTile(
                title: Text('$_name',
                    style: TextStyle(
                    fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.purple)),
                subtitle: Text('$_dose'),
              ),
            ],
          ),
    ),
      ),
    );
  }
}
