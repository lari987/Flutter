import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
   

  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  
  String dropdownMoeda1 = "Real";
  String dropdownMoeda2 = "Dolar";
  double resultado = 0;
  String valorConvertido = "";
  
 void _calcular() {
    setState(() {
       double valor = double.parse(n1Controller.text);

       if (dropdownMoeda1 == 'Real' && dropdownMoeda2 == 'Dolar'){
         resultado = valor * 0.21;
       }else if (dropdownMoeda1 == 'Real' && dropdownMoeda2 == 'Euro'){
         resultado = valor * 0.19;
       }else if (dropdownMoeda1 == 'Real' && dropdownMoeda2 == 'Bitcoin'){
         resultado = valor * 0.0000048;
       }else if (dropdownMoeda1 == 'Dolar' && dropdownMoeda2 == 'Euro'){
         resultado = valor * 0.92;
       }else if (dropdownMoeda1 == 'Dolar' && dropdownMoeda2 == 'Real'){
         resultado = valor * 4.72;
       }else if (dropdownMoeda1 == 'Dolar' && dropdownMoeda2 == 'Bitcoin'){
         resultado = valor * 0.000023;
       }else if (dropdownMoeda1 == 'Euro' && dropdownMoeda2 == 'Dolar'){
         resultado = valor * 1.09;
       }else if (dropdownMoeda1 == 'Euro' && dropdownMoeda2 == 'Real'){
         resultado = valor * 5.14;
       }else if (dropdownMoeda1 == 'Euro' && dropdownMoeda2 == 'Bitcoin'){
         resultado = valor * 0.000025;
       }else if (dropdownMoeda1 == 'Bitcoin' && dropdownMoeda2 == 'Real'){
         resultado = valor * 207144.36;
       }else if (dropdownMoeda1 == 'Bitcoin' && dropdownMoeda2 == 'Dolar'){
         resultado = valor * 43951.70;
       }else/* if (dropdownMoeda1 == 'Bitcoin' && dropdownMoeda2 == 'Euro')*/{
         resultado = valor * 40337.11;
       }

      valorConvertido = 'Valor Convertido: $resultado';
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
      height: 200,
      width: 200,
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

  _infValor(){
  return Container(
      child: Text(
        '$valorConvertido', 
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
      items: <String>['Real','Dolar', 'Euro','Bitcoin']
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
      items: <String>['Dolar','Euro', 'Real','Bitcoin']
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
