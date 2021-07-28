import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InforDetailView extends StatelessWidget {
  final String _title;
  final String _data;

  const InforDetailView(this._title, this._data);

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
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/images/info-bg-2.svg',
                height: 356,
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white),
              padding: EdgeInsets.all(24),
              child: Flex(direction: Axis.vertical, children: [
                Expanded(
                  flex: 1,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 28),
                          child: Row(
                            children: [
                              Text(
                                _title,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                        child: Text("$_data",
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      )
                    ],
                  ),
                ),
              ]
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
