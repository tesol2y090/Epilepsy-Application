import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TypeOfEpilepsy extends StatelessWidget {
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
                                "ประเภทของอาการชัก",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Container(
                        child: Column(
                          children: [
                            Text(
                                "ในปีพ.ศ. 2560 สมาพันธ์ต่อต้านโรคลมชักนานาชาติ(International League Against Epilepsy, ILAE)  ได้มีการทบทวนและ เปลี่ยนแปลงคำจำกัดความและการจำแนกชนิด ของอาการชัก โดยจำแนกเป็น 3 ชนิด  ได้แก่",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                    "\t\t\t\t 1. อาการชักที่มีจุดกำเนิดเฉพาะที่ (focal onset)",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t คือ อาการชักที่เกิดจากการเปลี่ยนแปลงของคลื่นไฟฟ้าสมองของสมองเฉพาะบางจุด โดยจำแนกอาการชักแบบเฉพาะที่เป็น 3 ชนิดย่อยดังนี้",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t • อาการชักเฉพาะที่โดยผู้ป่วยรู้สึกตัวดี (focal aware seizure)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t • อาการชักเฉพาะที่โดยผู้ป่วยไม่รู้สึกตัว (focal impaired awareness)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t • อาการชักเฉพาะที่ตามด้วยชักเกร็งกระตุกทั้งตัว(focal to bilateral tonic-clonic seizure)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t 2.	อาการชักจากสมองทุกส่วน (Generalized onset) ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t คืออาการชักที่เกิดจากการเปลี่ยนแปลงของคลื่นไฟฟ้าสมองทั้ง 2 ซีกตั้งแต่เริ่มต้นของการชัก	 มีชนิดของอาการชักที่พบได้บ่อยได้แก่อาการชักแบบเหม่อ (Absence seizure) อาการชักสะดุ้ง (myoclonic seizure)  และอาการชักชนิดตัวอ่อน (Atonic seizure ) อาการชักกระตุกทั้งตัว (generalized tonic-clonic seizure) เป็นต้น",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t 3.	อาการชักที่ไม่ทราบจุดกำเนิดชัดเจน (Unknown onset)",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                  "\t\t\t\t คืออาการชักที่ไม่ทราบจุดกำเนิดของคลื่นชัก ไม่สามารถเข้าได้กับ สองชนิดแรกอาจแยกย่อยเป็น อาการชักแบบเกร็งกระตุก (tonic-clonic), อาการชักแบบผวา (epileptic spasms) หรือแบบหยุดพฤติกรรมที่ทำอยู่ (behavior arrest)เป็นต้น",
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
