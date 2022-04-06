import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  
 var numero;
  

 void _calcular() {
    setState(() { 
     numero = new Random().nextInt(10);

    });
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _titulo(),
      backgroundColor: Colors.white,
      body: _corpo()
    );
  }
     _titulo() {
    return AppBar(
      title: Text("Jogo do Nº Aleatório"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo(),
          _text(),
          _button(),
        ],
      ),
    );

  }
         
   _foto() {
    return Center(
      child: Image.network(
        'https://ovest.com.br/wp-content/uploads/2017/09/nygma2-cover.jpg',
        height: 300,
        width: 300,
      ),
    );
  }


  _campo(){
    return Text(
      'Pense em um nº de 0 a 10:',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
    );
  }

     
    
     _text() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        '$numero',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromARGB(255, 16, 169, 47), fontSize: 25.0),
      ),
    );
  }
  
   _button() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 20.0, left: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcular,
          child: Text("Descobrir",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color:  Color.fromARGB(255, 240, 73, 73),
        ),
      ),
    );
  }
 
}
 
 