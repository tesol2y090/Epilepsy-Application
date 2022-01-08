import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/subjects.dart';

const String applicationName = "Epilepsy Care (ไทย)";

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();
class ReceivedNotification {
  ReceivedNotification({
    this.id,
     this.title,
     this.body,
     this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channel_id = "123";

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
        final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: (
            int id,
            String title,
            String body,
            String payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              ReceivedNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, iOS: initializationSettingsIOS, macOS: null);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    tz.initializeTimeZones();
  }

  Future selectNotification(String payload) async {}

  void showNotification(String type) async {
    DateTime now = TZDateTime.now(local);
    int year = now.year;
    int month = now.month;
    int date = now.day;
    int notiId;
    String title;
    String body;
    var timeToNoti;
    switch (type) {
      case "afterBreak":
        notiId = 111;
        title = "กินยาหลังอาหารเช้า";
        body = "ได้เวลากินยาหลังอาหารเช้า";
        timeToNoti = TZDateTime.local(year, month, date, 0, 30);
        break;
      case "afterLunch":
        notiId = 222;
        title = "กินยาหลังอาหารกลางวัน";
        body = "ได้เวลากินยาหลังอาหารกลางวัน";
        timeToNoti = TZDateTime.local(year, month, date, 4, 30);
        break;
      case "afterEven":
        notiId = 333;
        title = "กินยาหลังอาหารเย็น";
        body = "ได้เวลากินยาหลังอาหารเย็น";
        timeToNoti = TZDateTime.local(year, month, date, 10, 30);
        break;
      case "beforeBed":
        notiId = 444;
        title = "กินยาก่อนนอน";
        body = "ได้เวลากินยาก่อนนอน";
        timeToNoti = TZDateTime.local(year, month, date, 14, 30);
        break;
      default:
    }
    await flutterLocalNotificationsPlugin.zonedSchedule(
        notiId,
        title,
        body,
        timeToNoti,
        const NotificationDetails(
            android: AndroidNotificationDetails(
                channel_id, applicationName, applicationName)),
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void cancelNoti(String type) async {
    int notiId;
    switch (type) {
      case "afterBreak":
        notiId = 111;
        break;
      case "afterLunch":
        notiId = 222;
        break;
      case "afterEven":
        notiId = 333;
        break;
      case "beforeBed":
        notiId = 444;
        break;
      default:
    }
    await flutterLocalNotificationsPlugin.cancel(notiId);
  }
}
