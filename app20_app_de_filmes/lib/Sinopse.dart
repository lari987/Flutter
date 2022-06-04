import 'package:flutter/material.dart';
import 'Home.dart';
 
class Sinopse extends StatelessWidget {
 
 
  String valueNome;
  String valueSinopse;
  Sinopse({this.valueNome, this.valueSinopse});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("App de Filmes"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 21, 73, 245),
    );
  }
 
  _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _textNome(),
          _textSinopse(),
        ],
      ),
    );
  }
 
 
     _textNome() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
      child: Text(
        '$valueNome - Sinopse',
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18.0),
      ),
    );
  }
 
   _textSinopse() {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Text(
        valueSinopse,
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 18.0),
      ),
    );
  }
}