import 'package:flutter/material.dart';

class Product extends StatefulWidget {
//ส่งชื่อส่งค่า่เข้า
final String nameLogin;
Product({Key key,this.nameLogin}) : super(key: key);



  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),body: Text('body'),
    );
  }
}
