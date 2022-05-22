import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController n1Controller = TextEditingController();
  TextEditingController moedaController = TextEditingController();
  String info_login = '';
  String dropdownMoeda1 = "BRL";
  String dropdownMoeda2 = "USD";
  double resultado = 0;
 
  //String imagem = 'https://cdn-icons-png.flaticon.com/512/25/25231.png';
 
  _calcular() async {
    String url = 'https://economia.awesomeapi.com.br/json/last/${dropdownMoeda1}-${dropdownMoeda2}';
 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
 
    setState(() {
      double moeda = double.parse(retorno["${dropdownMoeda1+dropdownMoeda2}"]["ask"]);
      double valor = double.parse(n1Controller.text);

      if (dropdownMoeda1 == 'BRL' && dropdownMoeda2 == 'USD'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'BRL' && dropdownMoeda2 == 'EUR'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'BRL' && dropdownMoeda2 == 'BTC'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'USD' && dropdownMoeda2 == 'EUR'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'USD' && dropdownMoeda2 == 'BRL'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'USD' && dropdownMoeda2 == 'BTC'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'EUR' && dropdownMoeda2 == 'USD'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'EUR' && dropdownMoeda2 == 'BRL'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'EUR' && dropdownMoeda2 == 'BTC'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'BTC' && dropdownMoeda2 == 'BRL'){
         resultado = valor * moeda;
       }else if (dropdownMoeda1 == 'BTC' && dropdownMoeda2 == 'USD'){
         resultado = valor * moeda;
       }else/* if (dropdownMoeda1 == 'Bitcoin' && dropdownMoeda2 == 'Euro')*/{
         resultado = valor * moeda;
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
      title: Text("Conversor de Moedas"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 7, 18, 63),
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campoFoto(),
          _campo("Digite um valor para ser convertido:", n1Controller),
          _campoMoeda1(),
          _campoMoeda2(),
          _button(),
          _infValor(),
        ],
      ),
    );

  }

   _campoFoto() {
    return Container(
    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
            _foto(),
          ],
        ),
      );
    }
    
    _foto() {
    return Image.network(
      'https://www.informatique-mania.com/wp-content/uploads/2021/04/dos-hombres-intercambian-moneda_12389.jpg',
      height: 90,
      width: 90,
    );
  }

  
  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelTitulo, labelStyle: TextStyle(color: Color.fromARGB(255, 7, 18, 63), fontSize: 16.0, fontWeight: FontWeight.bold)),
        textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      controller: objController,
    );
  }

  _texto(){

  }

  _infValor(){
  return Container(
      child: Text(
        '$resultado', 
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromARGB(255, 7, 18, 63), fontSize: 16.0,fontWeight: FontWeight.bold),
      ),
    );
}


  _campoMoeda1(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _infMoeda1(),
            _dropdownMoeda1(),
          ],
        ),
      );
    }

_infMoeda1(){
  return Container(
      child: Text(
        'De:  ', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 7, 18, 63), fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
}


 _dropdownMoeda1() {
    return DropdownButton<String>(
      value: dropdownMoeda1,
      items: <String>['BRL','USD', 'EUR', 'BTC']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownMoeda1 = valorSelecionado!;
        });
      },
    );
  }

  _campoMoeda2(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _infMoeda2(),
            _dropdownMoeda2(),
          ],
        ),
      );
    }

_infMoeda2(){
  return Container(
      child: Text(
        'Para:  ', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 7, 18, 63), fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
}


 _dropdownMoeda2() {
    return DropdownButton<String>(
      value: dropdownMoeda2,
      items: <String>['USD','EUR', 'BRL','BTC']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownMoeda2 = valorSelecionado!;
        });
      },
    );
  }

   _button() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcular,
          child: Text("Converter",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color:  Color.fromARGB(255, 246, 190, 7),
        ),
      ),
    );
  }
 
}