import 'package:flutter/material.dart';
import 'package:shrine_app/color/colors.dart';
import 'package:shrine_app/home.dart';
import 'package:shrine_app/login.dart';
import 'package:shrine_app/supplemental/cut_corners_border.dart';

void main() => runApp(ShrineApp());

class ShrineApp extends StatelessWidget {
  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      accentColor: kShrineAltDarkGrey,
      primaryColor: kShrineAltDarkGrey,
      buttonColor: kShrineAltYellow,
      scaffoldBackgroundColor: kShrineAltDarkGrey,
      cardColor: kShrineAltDarkGrey,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineAltYellow),
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ),
    );
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline: base.headline.copyWith(
            fontWeight: FontWeight.w500,
          ),
          title: base.title.copyWith(fontSize: 18.0),
          caption: base.caption.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: kShrineSurfaceWhite,
          bodyColor: kShrineSurfaceWhite,
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
