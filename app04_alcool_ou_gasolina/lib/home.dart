import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  String infoResultado = "";

 void _calcular() {
    setState(() {
      double n1 = double.parse(n1Controller.text);
      double n2 = double.parse(n2Controller.text);

     double conta = n1 / n2;
     String resultado;

     if(conta <= 0.7){
       resultado = "O alcool é melhor!";
     }else{
       resultado = "A gasolina é melhor!";
     }
 
     infoResultado = resultado;
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
      title: Text("Alcool ou Gasolina?"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 235, 182, 38),
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _foto(),
          _campo("Preço do Álcool:", n1Controller),
          _campo("Preço da Gasolina:", n2Controller),
          _button(),
          _text(),
        ],
      ),
    );

  }
         
   _foto() {
    return Center(
      child: Image.network(
        'https://calculocerto.com/wp-content/uploads/2019/11/gasolina-alcool-calculadora.png',
        height: 200,
        width: 300,
      ),
    );
  }


  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black)),
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      controller: objController,
    );
  }

    
     _text() {
    return Container(
      child: Text(
        infoResultado,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 25.0),
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
          child: Text("Verificar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color:  Color.fromARGB(255, 235, 182, 38),
        ),
      ),
    );
  }
 
}
 