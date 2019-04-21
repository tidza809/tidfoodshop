import 'package:flutter/material.dart';
import 'regster.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import '../models/user_model.dart';
class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//Key
  final FormKey = GlobalKey<FormState>();
  final Scaffoldkey = GlobalKey<ScaffoldState>();

//varible
  String user, password;

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
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'User :',
          hintText: 'Fill You User Here',
          labelStyle: TextStyle(color: Colors.white)),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Plase Fill User in Blank';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  bool checkSpace(String value) {
    if (value.length == 0) {
      return true;
    } else {
      return false;
    }
  }

  Widget passwordTextFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Passwork :',
          hintText: 'More 6 Charactor ',
          labelStyle: TextStyle(color: Colors.white)),
      validator: (String value) {
        if (checkSpace(value)) {
          return 'Please fill Password';
        }
      },
      onSaved: (String value) {
        password = value;
      },
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
      onPressed: () {
        if (FormKey.currentState.validate()) {
          FormKey.currentState.save();
          print('user = $user , password = $password');
          checkUserAndPassword();
        }
      },
    );
  }

  void checkUserAndPassword() async {
    String urlSting =
        'http://androidthai.in.th/tid/getUserWheretid.php?isAdd=true&User=$user';
    var response = await get(urlSting);
    var result = json.decode(response.body);
    print('result = $result');

    if (result.toString() == 'null') {
      print('User False');
      showSnackbar('ไม่มี จะใส่ทำไม $user ไม่ต้องใส่');
    } else {
      print('User True');
      for (var objJSON in result) {
         
         print('objJSON = $objJSON');
         var userModel = UserModel.fromJSON(objJSON);

        String truePassword  = userModel.Password.toString();
        String name = userModel.Name.toString();


        print('password = $password, truePass = $truePassword');

        if (password == truePassword) {
           showSnackbar('ยินดีต้อนรับ $name');
        } else {
          showSnackbar('ผิดนะ ใสให้ถูกต้อง');

        }


      }


    } // if
  }

// ตัวนี้คือ ตัวเวลาให้โชว์ แทบบาร์ด้านล่าง
  void showSnackbar(String message) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 6),
      backgroundColor: Colors.green[900],
      content: Text(message),
      action: SnackBarAction(textColor: Colors.red,
        label: 'Close',onPressed: (){},
      ),
    );
    Scaffoldkey.currentState.showSnackBar(snackBar);
  }

  Widget registerButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'No Account:',
            style: TextStyle(color: Colors.pink),
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            color: Colors.green[800],
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              print('You Clink Register');
              var goToRegisterRoute = MaterialPageRoute(
                  builder: (BuildContext context) => Register());
              Navigator.of(context).push(goToRegisterRoute);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Scaffoldkey,
        resizeToAvoidBottomPadding: false,
        body: Form(
          key: FormKey,
          child: Container(
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
                registerButton(context)
              ],
            ),
          ),
        ));
  }
}
