import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WhatisCard extends StatelessWidget {
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
                                "โรคลมชักคืออะไร?",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                        child: Column(
                          children: [
                            Text(
                                "โรคลมชัก (epilepsy) คือ โรคที่ผู้ป่วยมีอาการชักซ้ำโดยที่ไม่มีปัจจัยกระตุ้น (provoking factor) ชัดเจน อาจจะพบพยาธิสภาพในสมองหรือไม่ก็ได้ ",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey)),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t ในกรณีผู้ป่วยชักครั้งแรกร่วมกับมีคลื่นไฟฟ้าสมองผิดปกติแบบ epileptiform discharge หรือมีรอยโรคใน สมอง จะมีโอกาสชักซ้ำสูง",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t ผู้ป่วยที่มีอาการชักจากความเจ็บป่วยปัจจุบัน เช่น ความผิดปกติทางเมตาโบลิก จากยา หรือ ไข้สูงในเด็ก โดยที่ไม่ได้มีพยาธิสภาพที่สมองชัดเจน จัดเป็นการชักที่มีปัจจัยชักนำ (provoked seizure) จึงไม่ถือว่าเป็นโรคลมชัก",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t การวินิจฉัยโรคลมชักใช้คำจำกัดความของโรคลมชักดังต่อไปนี้",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t 1. อาการชักโดยที่ไม่มีปัจจัยกระตุ้นตั้งแต่ 2 ครั้งขึ้นไป โดยอาการชัก 2 ครั้งนั้นต้องมีระยะเวลาห่างกันตั้งแต่ 24 ชั่วโมง ขึ้นไป",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t  2. อาการชักที่เกิดขึ้นเพียงครั้งเดียว โดยที่ไม่มีปัจจัยกระตุ้นในผู้ป่วยที่มีโอกาสเสี่ยงสูงที่จะมีอาการชักซ้ำโดยความเสี่ยงเท่ากับผู้ป่วยที่มีอาการชักโดยที่ไม่มีปัจจัยกระตุ้นตั้งแต่2ครั้งขึ้นไป",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t  3.	 กลุ่มอาการโรคลมชัก (epileptic syndrome) ชนิดต่างๆเช่นภาวะชักชนิดเหม่อ (absence) เป็นต้น",
                                  style:
                                      TextStyle(fontSize: 16, color: Colors.grey)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                    "อ้างอิงจาก http://www.pedceppmk.com",
                                    style:
                                        TextStyle(fontSize: 16, color: Colors.grey)),
                              ),
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
