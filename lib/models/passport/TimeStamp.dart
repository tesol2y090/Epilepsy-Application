import 'package:hive/hive.dart';

part 'TimeStamp.g.dart';

@HiveType(typeId: 1)
class TimeStamp extends HiveObject {
  @HiveField(0)
  String afterBreak;

  @HiveField(1)
  String afterLunch;

  @HiveField(2)
  String afterEven;

  @HiveField(3)
  String beforeBed;

  TimeStamp(this.afterBreak, this.afterLunch, this.afterEven, this.beforeBed);
}
