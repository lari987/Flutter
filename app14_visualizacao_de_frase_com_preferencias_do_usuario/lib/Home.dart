import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  bool switchCor = true;
  bool switchFonte = true;
 
  _salvarSwitchFundo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("cor", switchCor);
  }
 
  _recuperarSwitchFundo() async {
    final prefs = await SharedPreferences.getInstance();
 
    setState(() {
      switchCor = prefs.getBool("cor") == true;
    });
  }

  _salvarSwitchFonte() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("fonte", switchFonte);
  }
 
  _recuperarSwitchFonte() async {
    final prefs = await SharedPreferences.getInstance();
 
    setState(() {
      switchCor = prefs.getBool("fonte") == true;
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
      title: Text("Frases"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 29, 5, 76),
    );
  }

  _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _switchers(),
          _frase(),
        ],
      ),
    );
  }

  _switchers(){
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _textoSwitchCor(),
          _switchColor(),
          _textoSwitchFonte(),
          _switchFonte(),
        ],
      ),
    );
  }

  _switchColor() {
    return Switch(
      value: switchCor,
      onChanged: (value) {
        setState(() {
          switchCor = value;
          _salvarSwitchFundo();
        });
      },
      activeTrackColor: Color.fromARGB(255, 83, 48, 143),
      activeColor: Color.fromARGB(255, 186, 164, 222),
    );
  }

  _textoSwitchCor() {
    return Text(
     'Fundo claro',
     style: TextStyle(color: Colors.black, fontSize: 15.0),
    //)
    );
  }

  _textoSwitchFonte() {
    return Text(
     'Fonte pequena',
     style: TextStyle(color: Colors.black, fontSize: 15.0),
    //)
    );
  }

  _switchFonte() {
    return Switch(
      value: switchFonte,
      onChanged: (value) {
        setState(() {
          switchFonte = value;
          _salvarSwitchFonte();
        });
      },
     activeTrackColor: Color.fromARGB(255, 85, 54, 140),
    activeColor: Color.fromARGB(255, 186, 164, 222),
    );
  } 

  
    _frase(){
return Container(
   padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
   color: switchCor ? Colors.white : Colors.black,
      child: Text(
        '"A vingança nunca é plena, mata a alma e envenena"', 
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: switchFonte ? 15.0 : 25.0, color: switchFonte ? Colors.black : Colors.white),
      ),
    );
  }

  _informacoes2(){
return Container(
   padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
   color: Colors.black, 
      child: Text(
        '"A vingança nunca é plena, mata a alma e envenena"', 
        textAlign: TextAlign.start,
        style: TextStyle(color:Colors.white, fontSize: 25.0, fontStyle: FontStyle.italic),
      ),
    );
  }
  
}
