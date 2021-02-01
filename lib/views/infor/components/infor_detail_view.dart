import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InforDetailView extends StatelessWidget {
  final String title;

  const InforDetailView(this.title);

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
        children: <Widget>[
          Stack(
            children: [
              SvgPicture.asset(
                'assets/images/info-bg-2.svg',
                height: 356,
              )
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white),
              padding: EdgeInsets.all(24),
              child: Container(
                child: Expanded(
                  child: ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 28),
                          child: Row(
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                        child: Text(
                            "    เป็นภาวะทางระบบประสาทที่ทำให้ผู้ป่วยเกิดอาการชัก ซึ่งเป็นผลมาจาการเปลี่ยนแปลงอย่างเฉียบพลันของการส่งคลื่นสัญญาณกระแสไฟฟ้าของเซลล์สมองเป็นโรคที่มีความผิดปกติทางระบประสาทที่พบได้บ่อย องค์การอนามัยโลก กว่าว่า ในประเทศกำลังพัฒนามีอุบัติการณ์การเกิดเท่า 6-10 คนต่อ ประชากร 1,000 คน โรคลมชักเป็นโรคเรื้อรัง และต้องใช้ระยะเวลาในการรักษาอย่างต่อเนื่องเป็นเวลานานหากผู้ป่งยได้รับการดูแลรักษาที่ถูกต้องจะทำให้มีคุณภาพชีวิตที่ดีขึ้น ",
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      )
                    ],
                  ),
                ),
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
