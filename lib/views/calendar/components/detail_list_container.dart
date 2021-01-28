import 'package:flutter/material.dart';

import 'package:epilepsy/views/calendar/components/detail_card.dart';

class DetailListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView(
          children: [
            DetailCard(),
            DetailCard(),
            DetailCard(),
            FloatingActionButton(
              backgroundColor: Colors.purple,
              child: Icon(Icons.add),
              foregroundColor: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
