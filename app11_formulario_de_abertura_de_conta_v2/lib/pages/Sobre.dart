import 'package:flutter/material.dart';
import 'Home.dart';

class Sobre extends StatelessWidget {
 

  String valueNome;
  String valueIdade;
  String valueSexo;
  String valueEscolaridade;
  String valueLimite;
  String valueNacionalidade;
  Sobre({required this.valueNome, required this.valueIdade, required this.valueSexo, required this.valueEscolaridade, required this.valueLimite, required this.valueNacionalidade});

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
      title: Text("Dados Informados"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 91, 11, 240),
    );
  }

  _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _textNome(),
          _textIdade(),
          _textoDropdownSexo(),
          _textoDropdownEscolaridade(),
          _textoSlider(),
          _textoSwitch(),
        ],
      ),
    );

  }


     _textNome() {
    return Container(
      child: Text(
        valueNome, 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0),
      ),
    );
  }

   _textIdade() {
    return Container(
      child: Text(
        valueIdade, 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0),
      ),
    );
  }
  
  _textoDropdownSexo() {
    return Text(
      valueSexo,
      textAlign: TextAlign.start,
      style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0),
    );
  }

  _textoDropdownEscolaridade() {
    return Text(
      valueEscolaridade,
      textAlign: TextAlign.start,
      style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0),
    );
  }
 
 _textoSlider() {
    return Text(
      valueLimite,
          style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0),
    );
  }

_textoSwitch() {
    return Text(
      valueEscolaridade,
     style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0),
    //)
    );
  }
}
