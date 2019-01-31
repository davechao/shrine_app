import 'package:flutter/material.dart';
import 'package:shrine_app/color/colors.dart';
import 'package:shrine_app/widget/accent_color_override.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _buildLogo() {
    return Column(
      children: <Widget>[
        Image.asset('assets/icons/diamond.png'),
        SizedBox(height: 16.0),
        Text('SHRINE'),
      ],
    );
  }

  Widget _buildUserNameTextField() {
    return AccentColorOverride(
      color: kShrineBrown900,
      child: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          labelText: 'Username',
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return AccentColorOverride(
      color: kShrineBrown900,
      child: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
    );
  }

  Widget _buildCancelButton() {
    return FlatButton(
      child: Text('CANCEL'),
      onPressed: _clearData,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return RaisedButton(
      child: Text('NEXT'),
      elevation: 8.0,
      onPressed: _goHomePage,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
    );
  }

  _clearData() {
    _usernameController.clear();
    _passwordController.clear();
  }

  _goHomePage() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            _buildLogo(),
            SizedBox(height: 120.0),
            _buildUserNameTextField(),
            SizedBox(height: 12.0),
            _buildPasswordTextField(),
            ButtonBar(
              children: <Widget>[
                _buildCancelButton(),
                _buildNextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
