import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CauseCard extends StatelessWidget {
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
                                "สาเหตุของโรคลมชัก",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                        child: Column(
                          children: [
                            Text(
                                "สาเหตุของโรคลมชักเกิดจากภาวะใดๆก็ตามที่ก่อให้เกิดรอยโรคในสมอง เช่น อุบัติเหตุ, การติดเชื้อในสมอง,เนื้องอก และ ความผิดปกติของสมองแต่กำเนิดเป็นต้น",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey)),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t อย่างไรก็ดี การชักในเด็กส่วนใหญ่ โดยเฉพาะ เด็กที่มีพัฒนาการปกติมักตรวจไม่พบความผิดปกติของสมองใดๆ จากการตรวจทางรังสีวินิจฉัย",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                    "การตรวจวินิจฉัย",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t การวินิจฉัยโรคลมชักเพื่อให้ทราบถึงสาเหตุที่แท้จริงมีความสำคัญ เพราะทำให้ได้การรักษาที่มีประสิทธิภาพ นอกจากแพทย์จะทำการซักประวัติอย่างละเอียดแล้ว ยังมีเครื่องมือที่ทันสมัย เพื่อช่วยยืนยันการวินิจฉัยเช่น",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                    "การตรวจคลื่นไฟฟ้าสมอง (EEG)",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t ช่วยวินิจฉัยโรคลมชัก และทำให้สามารถบอกตำแหน่งของสมองที่เกิดการชักและชนิดของการชักได้",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "การตรวจเอกซเรย์คอมพิวเตอร์ (CT Scan) และการทำเอ็มอาร์ไอ (MRI)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t ช่วยให้แพทย์เห็นภาพความผิดปกติของสมองที่เป็นสาเหตุของโรคลมชักได้",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ]),
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
