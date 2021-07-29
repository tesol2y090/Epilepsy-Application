import 'package:hive/hive.dart';
import 'package:epilepsy/models/passport/TimeStamp.dart';

part 'PillCard.g.dart';

@HiveType(typeId: 2)
class PillCard extends HiveObject {
  @HiveField(0)
  String no;

  @HiveField(1)
  String name;

  @HiveField(2)
  String dose;

  @HiveField(3)
  String freqSideEffect;

  @HiveField(4)
  String dangerSideEffect;

  @HiveField(5)
  String allergy;

  @HiveField(6)
  String img;

  @HiveField(7)
  TimeStamp timeStamp;

  String getName() {
    return this.name;
  }

  PillCard(this.no, this.name, this.dose, this.freqSideEffect,
      this.dangerSideEffect, this.allergy, this.img, this.timeStamp);
}
