import 'package:flutter/material.dart';
import 'package:shrine_app/colors.dart';
import 'package:shrine_app/home.dart';
import 'package:shrine_app/login.dart';

void main() => runApp(ShrineApp());

class ShrineApp extends StatelessWidget {
  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: kShrinePink100,
        textTheme: ButtonTextTheme.normal,
      ),
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') return null;
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _buildShrineTheme(),
    );
  }
}
