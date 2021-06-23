import 'package:hive/hive.dart';

part 'package:epilepsy/models/calendar/ChuckCard.g.dart';

@HiveType(typeId: 0)
class ChuckCard {
  @HiveField(0)
  String type;

  @HiveField(1)
  String epilepsyType;

  @HiveField(2)
  String chuckTime;

  @HiveField(3)
  String detail;

  @HiveField(4)
  String location;

  @HiveField(5)
  DateTime timestamp;

  ChuckCard(this.type, this.epilepsyType, this.chuckTime, this.detail,
      this.location, this.timestamp);
}
