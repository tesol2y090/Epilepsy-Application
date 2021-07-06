import 'package:flutter/material.dart';

import 'package:epilepsy/views/about_us/components/contact_detail_data.dart';

class ContactDetailContainer extends StatefulWidget {
  @override
  _ContactDetailContainerState createState() => _ContactDetailContainerState();
}

class _ContactDetailContainerState extends State<ContactDetailContainer> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    ContactDetailData(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
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
                    "ช่องทางการติดต่อ",
                    style: TextStyle(fontSize: 14, color: Colors.purple),
                  ),
                ),
              ),
            ],
          ),
          _widgetOptions.elementAt(selectedIndex)
        ],
      ),
    );
  }
}
