import 'package:flutter/material.dart';

class Product extends StatefulWidget {
//ส่งชื่อส่งค่า่เข้า
  final String nameLogin;
  Product({Key key, this.nameLogin}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  String showNameLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    showNameLogin = widget.nameLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$showNameLogin ใช้งานอยู่: '),
        ),
        body: Container(padding: EdgeInsets.only(top: 100.0),
          alignment: Alignment(0, -1),
          child: Column(
            children: <Widget>[Text('Welcome'), Text(showNameLogin)],
          ),
        ));
  }
}
