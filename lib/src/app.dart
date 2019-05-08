import 'package:atta_mobile_app/src/screens/branch_location.dart';
import 'package:atta_mobile_app/src/screens/contactUs_screen.dart';
import 'package:atta_mobile_app/src/screens/event_screen.dart';
import 'package:atta_mobile_app/src/screens/event_teket.dart';
import 'package:atta_mobile_app/src/screens/favorite_screen.dart';

import 'package:atta_mobile_app/src/screens/login_screen.dart';
import 'package:atta_mobile_app/src/screens/news_screen.dart';
import 'package:atta_mobile_app/src/screens/profile_screen.dart';
import 'package:atta_mobile_app/src/screens/splash_screen.dart';
import 'package:atta_mobile_app/src/screens/ticket_detail.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';
import 'package:flutter/material.dart';

import 'package:mvc_pattern/mvc_pattern.dart';

class MVCApp extends AppMVC {
  static MaterialApp _app;

  final appTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'DIN',
    // primaryColorDark: const Color(0xff000000),
    // primaryColorLight: const Color(0xff000000),
    // primaryColor: const Color(0xff000000),
    // accentColor: const Color(0xff000000),
    // dividerColor: const Color(0xffBDBDBD),
  );

  Widget build(BuildContext context) {
    _app = MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'atta app',
        theme: appTheme,
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          "/Splash": (context) => SplashScreen(),
          "/Home": (context) => LayoutScreen(),
          "/Login": (context) => LoginScreen(),
          "/News": (context) => NewsScreen(),
          '/Event': (context) => EventScreen(),
          '/About': (context) => ContactUsScreen(),
          '/Favorite': (context) => FavoriteScreen(),
          '/Profile': (context) => ProfileScreen(),
          '/EventTeket': (context) => EventTeket(),
          '/TicketDetail': (context) => TicketDetailScreen(),
          '/BranchLocation': (context) => BranchLocationScreen(),
        },
        builder: (BuildContext context, Widget child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Builder(
              builder: (BuildContext context) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1.0,
                    ),
                    child: child);
              },
            ),
          );
        });
    return _app;
  }
}
