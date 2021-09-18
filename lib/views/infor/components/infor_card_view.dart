import 'package:flutter/material.dart';

import 'package:epilepsy/views/infor/components/infor_detail_view.dart';
import 'package:epilepsy/views/infor/components/what_is_epilepsy_card.dart';
import 'package:epilepsy/views/infor/components/type_of_epilepsy_card.dart';
import 'package:epilepsy/views/infor/components/cause_of_epileypsy_card.dart';
import 'package:epilepsy/views/infor/components/rescure_epilepsy_card.dart';

class InforCardView extends StatelessWidget {
  final String _header;
  final String _detail;
  final String _image;
  final String _data;

  const InforCardView(this._header, this._detail, this._image, this._data,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => _header == "โรคลมชักคืออะไร?"
                    ? WhatisCard()
                    : _header == "ประเภทของอาการชัก"
                        ? TypeOfEpilepsy()
                        : _header == "สาเหตุของการชัก"
                            ? CauseCard()
                            : RescureCard())),
        child: Card(
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
            )));
  }
}
