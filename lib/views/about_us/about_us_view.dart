import 'package:flutter/material.dart';

import 'package:epilepsy/views/about_us/components/contact_container.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(0, 98, 0, 0),
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
                      'ช่องทางการติดต่อ',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/about-logo.png',
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
              margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
              child: Column(
                children: [ContactDetailContainer()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
