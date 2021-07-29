import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/passport/components/passport_card_view.dart';
import 'package:epilepsy/models/passport/TimeStamp.dart';
import 'package:epilepsy/models/passport/PillCard.dart';


class PassportView extends StatelessWidget {
  List<PillCard> initPillDatas = [
    PillCard(
        "1",
        "Carbamazepin / Tegretal",
        "2%",
        "คลื่นไส้ ซึม เดินเซ เห็นภาพซ้อน",
        "Hyponatremia (SIADH), Aplastic anemia, ตับอักเสบ เม็ดเลือดขาวต่ำ",
        "skin rash, Steven Johnson syndrome*",
        "assets/images/drug_1.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "2",
        "Gabapentin / Berliontin",
        "300 mg",
        "ง่วงนอน ซึม เวียนศีรษะ บวม",
        "-",
        "-",
        "assets/images/drug_2.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "3",
        "Levetiracetam / Keppra",
        "100 mg /ml.",
        "ซึม มึนงง",
        "อารมณ์หงุดหงิด ก้าวร้าว อาการทางจิต",
        "-",
        "assets/images/drug_3.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "4",
        "Oxcarbazepine / Trileptal",
        "300 mg",
        "ซึม มึนงง เดินเซ",
        "hyponatremia",
        "-",
        "assets/images/drug_4.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "5",
        "Phenobarbital",
        "30 mg",
        "เด็ก: ซุกซนไม่อยู่สุข พฤติกรรม เปลี่ยนแปลงก้าวร้าว, ผู้ใหญ่: ง่วงซึม อ่อนเพลีย บุคลิกภาพเปลี่ยนแปลง เครียด",
        "Serum sickness (เป็นปฏิกิริยาที่เกิดจากระบบภูมิคุ้มกันในร่างกายไวต่อสิ่งกระตุ้นมากผิดปกติ ส่งผลให้เกิดอาการต่าง ๆ เช่น ไข้ ผื่นคัน ปวดตามข้อ บวมบริเวณใบหน้า เป็นต้น )",
        "-",
        "assets/images/drug_4.jpg", //no img
        TimeStamp(false, false, false, false)),
    PillCard(
        "6",
        "Phenytoin / Dilantin",
        "125 mg/5ml.",
        "เวียนศีรษะ เห็นภาพซ้อน ซึม เดินเซ คลื่นไส้ อาเจียน เหงือกบวม หน้าหยาบ hirsutism สิวเพิ่มขึ้น",
        "ตับอักเสบ แคลเซียมต่ำ choreo-athetosis ไข้ และต่อมน้ำเหลืองโตทั่วไป เส้นประสาท อักเสบ megaloblastic anemia (folate deficiency) cerebellar degeneration",
        "skin rash, Steven Johnson syndrome",
        "assets/images/drug_6.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "7",
        "Perampanel / Fycompa",
        "2 , 4 , 8 mg ",
        "มึนศีรษะ ง่วงซึม เดินเซ",
        "หงุดหงิด ก้าวร้าว อาการทางจิต มี suicidal ideation",
        "-",
        "assets/images/drug_7.png",
        TimeStamp(false, false, false, false)),
    PillCard("8", "Pregabalin / Lyrica", "25 mg", "ง่วงนอน ซึม เวียนศีรษะ", "-",
        "-", "assets/images/drug_8.jpg", TimeStamp(false, false, false, false)),
    PillCard(
        "9",
        "Sodium valproate / Depakin",
        "200 mg/ml",
        "มือสั่น คลื่นไส้ อาเจียน ปวดท้อง ผมร่วง น้ำหนักเพิ่ม",
        "ตับอักเสบ ตับอ่อนอักเสบ ภาวะเกล็ดเลือด ต่ำ ภาวะ hyperammonemia",
        "-",
        "assets/images/drug_9.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "10",
        "Topiramate /Topamax",
        "25  mg",
        "มึนงง เดินเซ การพูดผิดปกติ น้ำหนักลด",
        "นิ่วในไต ต้อหิน เหงื่อออกน้อย (oligohidrosis) ความคิดเชื่องช้า ภาวะ hyperammonemia",
        "-",
        "assets/images/drug_10.jpg",
        TimeStamp(false, false, false, false)),
    PillCard(
        "11",
        "Vigabatrin / Sabril",
        "500 mg",
        "มึนงง ง่วงซึม",
        "ความผิดปกติของลานสายตา",
        "-",
        "assets/images/drug_4.jpg", //no img
        TimeStamp(false, false, false, false)),
    PillCard(
        "12",
        "Lacosamide",
        "-",
        "มึนงง ง่วงซึม ภาพซ้อน เดินเซ",
        "Atrioventricular block, palpitation",
        "-",
        "assets/images/drug_4.jpg", //no img
        TimeStamp(false, false, false, false))
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final pillBox = Hive.box('pill_data');
    if (pillBox.get(formattedDate) == null) {
      pillBox.put(formattedDate, initPillDatas);
    }
    List<dynamic> pillDatas = pillBox.get(formattedDate);
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
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  'ไดอารี่การกินยา',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      child: pillDatas != null
                          ? ListView.builder(
                              padding: EdgeInsets.only(bottom: 36),
                              itemCount: pillDatas.length,
                              itemBuilder: (context, index) {
                                final data = pillDatas[index];
                                return Column(children: [
                                  PassportCardView(
                                    data.no,
                                      data.name,
                                      data.dose,
                                      data.freqSideEffect,
                                      data.dangerSideEffect,
                                      data.allergy,
                                      data.img)
                                ]);
                              })
                        : null)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
