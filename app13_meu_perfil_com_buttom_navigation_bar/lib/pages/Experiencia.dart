import 'package:flutter/material.dart';
 
class Experiencia extends StatelessWidget {
  const Experiencia({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: _corpo(),
      ),
    );
  }

  _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _text(),
        ],
      ),
    );

  }

   _text() {
    return Container(
      child: Text(
        'Experiência', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 17, 5, 109), fontSize: 28.0),
      ),
    );
  }
}