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
        "-",
        "คลื่นไส้ ซึม เดินเซ เห็นภาพซ้อน",
        "Hyponatremia (SIADH), Aplastic anemia, ตับอักเสบ เม็ดเลือดขาวต่ำ",
        "skin rash, Steven Johnson syndrome*",
        "assets/images/drug_1.jpg",
        TimeStamp("", "", "", "")),
    PillCard(
        "2",
        "Clonazepam / Rivotril®",
        "-",
        "อ่อนเพลีย ง่วง พฤติกรรมเปลี่ยนแปลง น้ำลายและเสมหะมาก",
        "กดการหายใจ",
        "-",
        "assets/images/drug_2.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "3",
        "Lamotrigine / Lamictal®",
        "-",
        "มึนงง เห็นภาพซ้อน เดินเซ",
        "ผื่น Stevens-Johnson syndrome",
        "-",
        "assets/images/drug_3.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "4",
        "Levetiracetam /  Keppra®",
        "-",
        "ซึม มึนงง",
        "อารมณ์หงุดหงิด ก้าวร้าว",
        "-",
        "assets/images/drug_4.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "5",
        "Oxcarbazepine / Trileptal®",
        "-",
        "มึนงง ง่วงซึม เดินเซ",
        "ภาวะโซเดียมต่ำ",
        "-",
        "assets/images/drug_5.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "6",
        "Phenobarbital",
        "-",
        "เด็ก: ซุกซนไม่อยู่สุข พฤติกรรมเปลี่ยนแปลง ก้าวร้าว ผู้ใหญ่: ง่วงซึม อ่อนเพลีย",
        "ผื่น Stevens-Johnson syndrome",
        "-",
        "assets/images/drug_6.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "7",
        "Phenytoin / Dilantin®",
        "-",
        "เวียนศีรษะ เห็นภาพซ้อน ซึม เดินเซ คลื่นไส้ อาเจียน เหงือกบวม หน้าหยาบ ขนเยอะ สิวเพิ่มขึ้น",
        "ผื่น Stevens-Johnson syndromeตับอักเสบ",
        "-",
        "assets/images/drug_7.png",
        TimeStamp("", "", "", "")),
    PillCard("8", "Sodium valproate/ Depakin®", "25 mg", "มือสั่น คลื่นไส้ อาเจียนปวดท้อง ผมร่วง น้ำหนักเพิ่ม", "ตับอักเสบ ตับอ่อนอักเสบ",
        "-", "assets/images/drug_8.png", TimeStamp("", "", "", "")),
    PillCard(
        "9",
        "Topiramate / Topamax®",
        "-",
        "มึนงง เดินเซ ความคิดเชื่องช้า การพูดผิดปกติ น้ำหนักลด",
        "นิ่วในไต ต้อหิน เหงื่อออกน้อย ",
        "-",
        "assets/images/drug_9.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "10",
        "Vigabatrin / Sabril®",
        "-",
        "มึนงง ง่วงซึม",
        "ความผิดปกติของลานสายตา",
        "-",
        "assets/images/drug_10.png",
        TimeStamp("", "", "", "")),
    PillCard(
        "11",
        "Perampanel / Fycompa®",
        "-",
        "มึนงง ง่วงซึมเดินเซ",
        "หงุดหงิด ก้าวร้าว อาการทางจิต",
        "-",
        "assets/images/drug_11.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "12",
        "Lacosamide / Vimpat®",
        "-",
        "มึนงง ง่วงซึม ภาพซ้อน เดินเซ",
        "Atrioventricular block, palpitation",
        "-",
        "assets/images/drug_12.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "13",
        "Pregabalin / Lyrica®",
        "-",
        "ง่วงนอน ซึม เวียนศีรษะ",
        "มักไม่ค่อยพบ",
        "-",
        "assets/images/drug_13.png", //no img
        TimeStamp("", "", "", "")),
    PillCard(
        "14",
        "Gabapentin / Neurontin® / Berlontin®",
        "-",
        "ง่วงนอน ซึม เวียนศีรษะ",
        "มักไม่ค่อยพบ",
        "-",
        "assets/images/drug_12.png", //no img
        TimeStamp("", "", "", ""))
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
