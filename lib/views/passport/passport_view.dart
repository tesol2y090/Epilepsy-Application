import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:epilepsy/views/passport/components/add_passport.dart';
import 'package:epilepsy/views/passport/components/passport_card_view.dart';

class PassportView extends StatelessWidget {
  static const pill_data = [
    {
      "no": "1",
      "name": "Carbamazepin / Tegretal",
      "dose": "2%",
      "freq_side_effect": "คลื่นไส้ ซึม เดินเซ เห็นภาพซ้อน",
      "danger_side_effect":
          "Hyponatremia (SIADH), Aplastic anemia, ตับอักเสบ เม็ดเลือดขาวต่ำ",
      "allergy": "skin rash, Steven Johnson syndrome*",
      "img": "assets/images/drug_1.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "2",
      "name": "Gabapentin / Berliontin",
      "dose": "300 mg",
      "freq_side_effect": "ง่วงนอน ซึม เวียนศีรษะ บวม",
      "danger_side_effect": "-",
      "allergy": "-",
      "img": "assets/images/drug_2.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "3",
      "name": "Levetiracetam / Keppra",
      "dose": "100 mg /ml.",
      "freq_side_effect": "ซึม มึนงง",
      "danger_side_effect": "อารมณ์หงุดหงิด ก้าวร้าว อาการทางจิต",
      "allergy": "-",
      "img": "assets/images/drug_3.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "4",
      "name": "Oxcarbazepine / Trileptal",
      "dose": "300 mg",
      "freq_side_effect": "ซึม มึนงง เดินเซ",
      "danger_side_effect": "hyponatremia",
      "allergy": "-",
      "img": "assets/images/drug_4.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "5",
      "name": "Phenobarbital",
      "dose": "30 mg",
      "freq_side_effect":
          "เด็ก: ซุกซนไม่อยู่สุข พฤติกรรม เปลี่ยนแปลงก้าวร้าว, ผู้ใหญ่: ง่วงซึม อ่อนเพลีย บุคลิกภาพเปลี่ยนแปลง เครียด",
      "danger_side_effect":
          "Serum sickness (เป็นปฏิกิริยาที่เกิดจากระบบภูมิคุ้มกันในร่างกายไวต่อสิ่งกระตุ้นมากผิดปกติ ส่งผลให้เกิดอาการต่าง ๆ เช่น ไข้ ผื่นคัน ปวดตามข้อ บวมบริเวณใบหน้า เป็นต้น )",
      "allergy": "-",
      "img": "assets/images/drug_4.jpg", //no img
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "6",
      "name": "Phenytoin / Dilantin",
      "dose": "125 mg/5ml.",
      "freq_side_effect":
          "เวียนศีรษะ เห็นภาพซ้อน ซึม เดินเซ คลื่นไส้ อาเจียน เหงือกบวม หน้าหยาบ hirsutism สิวเพิ่มขึ้น",
      "danger_side_effect":
          "ตับอักเสบ แคลเซียมต่ำ choreo-athetosis ไข้ และต่อมน้ำเหลืองโตทั่วไป เส้นประสาท อักเสบ megaloblastic anemia (folate deficiency) cerebellar degeneration",
      "allergy": "skin rash, Steven Johnson syndrome",
      "img": "assets/images/drug_6.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "7",
      "name": "Perampanel / Fycompa",
      "dose": "2 , 4 , 8 mg ",
      "freq_side_effect": "มึนศีรษะ ง่วงซึม เดินเซ",
      "danger_side_effect":
          "หงุดหงิด ก้าวร้าว อาการทางจิต มี suicidal ideation",
      "allergy": "-",
      "img": "assets/images/drug_7.png",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "8",
      "name": "Pregabalin / Lyrica",
      "dose": "25 mg",
      "freq_side_effect": "ง่วงนอน ซึม เวียนศีรษะ",
      "danger_side_effect": "-",
      "allergy": "-",
      "img": "assets/images/drug_8.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "9",
      "name": "Sodium valproate / Depakin",
      "dose": "200 mg/ml",
      "freq_side_effect":
          "มือสั่น คลื่นไส้ อาเจียน ปวดท้อง ผมร่วง น้ำหนักเพิ่ม",
      "danger_side_effect":
          "ตับอักเสบ ตับอ่อนอักเสบ ภาวะเกล็ดเลือด ต่ำ ภาวะ hyperammonemia",
      "allergy": "-",
      "img": "assets/images/drug_9.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "10",
      "name": "Topiramate /Topamax",
      "dose": "25  mg",
      "freq_side_effect": "มึนงง เดินเซ การพูดผิดปกติ น้ำหนักลด",
      "danger_side_effect":
          "นิ่วในไต ต้อหิน เหงื่อออกน้อย (oligohidrosis) ความคิดเชื่องช้า ภาวะ hyperammonemia",
      "allergy": "-",
      "img": "assets/images/drug_10.jpg",
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "11",
      "name": "Vigabatrin / Sabril",
      "dose": "500 mg",
      "freq_side_effect": "มึนงง ง่วงซึม",
      "danger_side_effect": "ความผิดปกติของลานสายตา",
      "allergy": "-",
      "img": "assets/images/drug_4.jpg", //no img
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
    {
      "no": "12",
      "name": "Lacosamide",
      "dose": "-",
      "freq_side_effect": "มึนงง ง่วงซึม ภาพซ้อน เดินเซ",
      "danger_side_effect": "Atrioventricular block, palpitation",
      "allergy": "-",
      "img": "assets/images/drug_4.jpg", //no img
      "time_stamp": {
        "beforeBreak": false,
        "afterBreak": false,
        "beforeLunch": false,
        "afterLunch": false,
        "beforeEven": false,
        "afterEven": false,
        "beforeBed": false
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final pillBox = Hive.box('pill_data');
    if (pillBox.get(formattedDate) == null) {
      pillBox.put(formattedDate, pill_data);
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
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white),
              margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: Container(
                child: Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 36),
                        itemCount: pillDatas.length,
                        itemBuilder: (context, index) {
                          final data = pillDatas[index];
                          return Column(children: [
                            PassportCardView(
                                data["no"],
                                data["name"],
                                data["dose"],
                                data["freq_side_effect"],
                                data["danger_side_effect"],
                                data["allergy"],
                                data["img"])
                          ]);
                        })
                    // child: ListView(
                    // children: [
                    //   PassportCardView(
                    //       'ยาแก้อาการชัก',
                    //       'ควรกินก่อนเวลา 12.00 ของทุกวัน',
                    //       'assets/images/drug-pill.jpg'),
                    //   PassportCardView(
                    //       'ยาแก้อาการชัก',
                    //       'ควรกินก่อนเวลา 12.00 ของทุกวัน',
                    //       'assets/images/drug-pill.jpg'),
                    //   PassportCardView(
                    //       'ยาแก้อาการชัก',
                    //       'ควรกินก่อนเวลา 12.00 ของทุกวัน',
                    //       'assets/images/drug-pill.jpg'),
                    //   FloatingActionButton(
                    //     backgroundColor: Colors.purple,
                    //     child: Icon(Icons.add),
                    //     foregroundColor: Colors.white,
                    //     onPressed: () => Navigator.push(context,
                    //         MaterialPageRoute(builder: (_) => AddPassport())),
                    //   )
                    // ],
                    // ),
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
