import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController cepController = TextEditingController();
  String info_cep = '';
 
  _recuperarLogin() async {
    String url = 'https://viacep.com.br/ws/${cepController.text}/json/';

 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
 
    setState(() {
      int cep = retorno["cep"];
      String logradouro = retorno["logradouro"];
      String bairro = retorno["bairro"];
      String localidade = retorno["localidade"];
      String uf = retorno["uf"];

      info_cep =
          'Cep: $cep\nLogradouro: $logradouro\nBairro: $bairro\nCidade: $localidade\nEstado: $uf';

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
      title: Text("Cep x Endereço"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 0, 179, 134),
    );
  }

_corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campoFoto(),
          _campoPrincipal(),
          _informacoes(),
        ],
      ),
    );

  }

  _campoFoto() {
    return Container(
    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
            _foto(),
          ],
        ),
      );
    }

  _campoPrincipal(){
          return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _campo(),
          _button(),
        ],
      ),
    );
  }


  _campo() {
    return Flexible(
   child: TextField(
      controller: cepController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
         border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40)
         ),
         hintText: 'Digite seu login...',
      ),
   ),
 );  
}

_informacoes(){
return Container(
   padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        info_cep, 
        textAlign: TextAlign.start,
        style: TextStyle(color:Colors.black , fontSize: 16.0),
      ),
    );
  }

_button() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        height: 50.0,
        width: 90.0,
        child: RaisedButton(
          onPressed: _recuperarLogin,
          color: Color.fromARGB(255, 0, 179, 134),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.done),
                  ],
                ),
        ),
      ),
    );
  }

  _foto() {
    return Image.network(
     'https://lirp.cdn-website.com/cc407b53/dms3rep/multi/opt/responsive-google-maps-1500x750-640w.png',
      height: 200,
      width: 200,
    );

}
 
}