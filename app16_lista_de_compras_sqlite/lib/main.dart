import 'package:flutter/material.dart';
import 'package:app16_lista_de_compras_sqlite/Home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}