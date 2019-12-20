import 'package:admob_flutter/admob_flutter.dart';
import 'package:darkmode/BlocTheme/BlogTheme.dart';
import 'package:darkmode/common/Common.dart';
import 'package:darkmode/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;
void main() async {
  Admob.initialize(Common.ADS_ID);
  preferences = await SharedPreferences.getInstance();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static var platform = MethodChannel(Common.CHANNEL);
  static var blogTheme = new BlogTheme();
  var modeTheme = preferences.getInt("mode");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: blogTheme.getStream(),
      builder: (ctx, sn) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dark Mode',
//      theme: themeDark(),
        theme: !sn.hasData
            ? themeLight()
            : sn.data == Common.MODE_NIGHT_NO ? themeLight() : sn.data == Common.MODE_NIGHT_YES ? themeDark() : themeDark(),
        home: HomePage(blogTheme),
      ),
    );
  }

  darkTextTheme() {
    return TextStyle(color: Colors.white);
  }

  lightTextTheme() {
    return TextStyle(color: Color.fromRGBO(37, 46, 72, 1));
  }

  themeLight() {
    return ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            title: lightTextTheme(),
            button: lightTextTheme(),
            subtitle: lightTextTheme(),
            caption: lightTextTheme(),
            headline: lightTextTheme(),
            body1: lightTextTheme(),
            body2: lightTextTheme()));
  }

  themeDark() {
    return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
            title: darkTextTheme(),
            button: darkTextTheme(),
            subtitle: darkTextTheme(),
            caption: darkTextTheme(),
            headline: darkTextTheme(),
            body1: darkTextTheme(),
            body2: darkTextTheme()));
  }
}
