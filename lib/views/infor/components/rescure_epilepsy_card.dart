import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RescureCard extends StatelessWidget {
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
                                "การรักษาโรคลมชัก",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                        child: Column(
                          children: [
                            Text(
                                "\t\t\t\t1. การใช้ยากันชัก เป็นการรักษาหลักของโรคลมชัก โดยทั่วไปต้องรับประทานยากันชักติดต่อกันอย่างน้อย 2 ปีหรือนานกว่านั้น ในปัจจุบันยากันชักมีอยู่หลายชนิด ซึ่งแพทย์จะพิจารณาเลือกให้เหมาะสมกับอาการชัก รวมถึงพิจารณาความปลอดภัยและประสิทธิภาพในการควบคุมอาการชัก",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text("\t\t\t\t2. อาหารคีโตน",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t3. การผ่าตัดโรคลมชัก มีข้อบ่งชี้ในผู้ป่วยโรคลมชักที่มีภาวะดื้อต่อยากันชัก ส่งผลกระทบต่อคุณภาพชีวิต หรือผู้ป่วยมีรอยโรคในสมองที่รักษาด้วยการผ่าตัดได้",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text("วิธีการปฐมพยาบาล ผู้ป่วยขณะชัก",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t1. ถอดแว่นตา คลายกระดุม ที่คอเสื้อ คลายเข็มขัดที่กางเกงหรือกระโปรง",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t2. จับนอนตะแคงบนพื้นหรือบนเตียงห่างจากสิ่งอันตรายต่างๆ และหันศีรษะไปด้านใดด้านหนึ่งเพื่อป้องกันการสำลักและลิ้นตกไปอุดกั้นทางเดินหายใจ ดังรูป",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/rescure.png',
                                  width: 200,
                                  height: 200,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t3.ห้ามงัดปากหรือสอดใส่วัตถุใดๆ ในช่องปากขณะชัก เพราะอาจจะทำให้ฟันหัก หรือสำลัก และเกิดอันตรายได้",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                    "\t\t\t\t4.ห้ามกรอกยาขณะชัก เพราะอาจทำให้สำลักได้",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t5. ห้ามจับมัดหรือตรึง เพราะอาจทำให้ชักมากขึ้นหรือนานขึ้น และอาจทำให้เกิดการฟกช้ำหรือกระดูกหักได้",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                             Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t6. เฝ้าสังเกตอาการผู้ป่วยขณะชัก และจับเวลาที่เกิดอาการชัก หรืออาจใช้การบันทึกภาพวิดีโอ ตามปกติผู้ป่วยลมชักจะมีอาการสงบลงได้เองเมื่อผ่านไป 2-3 นาที หากมีอาการชักเกิน 5 นาทีควรรีบส่งแพทย์",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t7. ถ้าอาการดีขึ้นและมียากันชักกินอยู่แล้ว ควรรีบปรึกษาหมอเรื่องการปรับยาใหม่ ไม่ควรเพิ่มยาเอง",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text("ที่มา : https://epilepsy.kku.ac.th/poster.html",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey)),
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
