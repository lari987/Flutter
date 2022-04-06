import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  int _counter = 0;
 
  void _incremento() {
    setState(() {
      _counter++;
    });
  }
  void _decremento(){
    setState(() {
      if(_counter > 0){
      _counter--;
      }
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
      title: Text("Contador de Pessoas"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 63, 137, 221),
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _corpoText(),
          _corpoButtons(),
        ],
      ),
    );

        }
         _corpoText() {
          return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
          ],
        ),
      );
    }
    _corpoButtons() {
          return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _button1(),
            _button2(),
          ],
        ),
      );
    }
    
     _text() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        '$_counter',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 25.0),
      ),
    );
  }
  
 
    _button1() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, right: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _incremento,
          child: Text("+",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color.fromARGB(255, 108, 211, 116),
        ),
      ),
    );
  }
   _button2() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _decremento,
          child: Text("-",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color: Color.fromARGB(255, 231, 98, 98),
        ),
      ),
    );
  }
 
}
 
  
  


