import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'package:epilepsy/views/home/home_view.dart';
import 'package:epilepsy/views/infor/infor_view.dart';
import 'package:epilepsy/views/calendar/calendar_view.dart';
import 'package:epilepsy/views/passport/passport_view.dart';
import 'package:epilepsy/views/user/user_view.dart';
import 'package:epilepsy/views/about_us/about_us_view.dart';

import 'package:epilepsy/models/calendar/ChuckCard.dart';
import 'package:epilepsy/models/passport/TimeStamp.dart';
import 'package:epilepsy/models/passport/PillCard.dart';
import 'package:epilepsy/models/noti/notification_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ChuckCardAdapter());
  Hive.registerAdapter(TimeStampAdapter());
  Hive.registerAdapter(PillCardAdapter());
  await Hive.openBox('user_data');
  await Hive.openBox('chuck_data');
  await Hive.openBox('pill_data');
  await NotificationService().init();
  runApp(MyApp());
}

Future loadBox() async {
  await Hive.openBox('user_data');
  await Hive.openBox('chuck_data');
  await Hive.openBox('pill_data');
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epilepsy Passport',
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder(
          future: loadBox(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return MyHomePage(title: 'Flutter Demo Home Page');
            } else {
              return Scaffold();
            }
          }),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    // HomeView(), //Home page
    UserView(), //User page
    InforView(), //Information page
    CalendarView(), //Calendar page
    PassportView(), //Passport page
    AboutUs() //About us page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.home),
          //   label: 'Home',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ผู้ใช้',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'ข้อมูล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'ปฏิทิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'ยา',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'ช่องทางติดต่อ',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: onItemTapped,
      ),
    );
  }
}
