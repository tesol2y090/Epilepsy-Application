import 'package:hive/hive.dart';

part 'TimeStamp.g.dart';

@HiveType(typeId: 1)
class TimeStamp extends HiveObject {
  @HiveField(0)
  bool afterBreak;

  @HiveField(1)
  bool afterLunch;

  @HiveField(2)
  bool afterEven;

  @HiveField(3)
  bool beforeBed;

  TimeStamp(this.afterBreak, this.afterLunch, this.afterEven, this.beforeBed);
}
