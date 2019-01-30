import 'package:flutter/material.dart';

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
        Image.asset('assets/diamond.png'),
        SizedBox(height: 16.0),
        Text('SHRINE'),
      ],
    );
  }

  Widget _buildUserNameTextField() {
    return TextField(
      controller: _usernameController,
      decoration: InputDecoration(
        filled: true,
        labelText: 'Username',
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        filled: true,
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  Widget _buildCancelButton() {
    return FlatButton(
      child: Text('CANCEL'),
      onPressed: _clearData,
    );
  }

  Widget _buildNextButton() {
    return RaisedButton(
      child: Text('NEXT'),
      onPressed: _goHomePage,
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
