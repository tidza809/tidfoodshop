import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget ShowLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showAppName() {
    return Text(
      'Tid Food Shop ',
      style: TextStyle(
          fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.red[300]),
    );
  }

  Widget userTextFormField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'User :',
          hintText: 'Fill You User Here',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Passwork :',
          hintText: 'More 6 Charactor ',
          labelStyle: TextStyle(color: Colors.white)),
    );
  }

  Widget loginButton() {
    return RaisedButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0)),
      color: Colors.green[900],
      child: Text(
        'Login',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget registerButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('No Account:'),
          RaisedButton( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            color: Colors.green[800],
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan[900], Colors.green[200]],
                begin: Alignment(1, -1))),
        padding: EdgeInsets.only(top: 40.0, left: 50.0, right: 50.0),
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            ShowLogo(),
            Container(
              margin: EdgeInsets.only(top: 15.0),
              child: showAppName(),
            ),
            Container(
              child: userTextFormField(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: passwordTextFormField(),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Expanded(
                    child: loginButton(),
                  ),
                )
              ],
            ),
            registerButton()
          ],
        ),
      ),
    );
  }
}
