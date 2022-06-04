import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Sinopse.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  List<dynamic> filmes = List.empty();
 
    _recuperarFilmes() async {
    String url = 'https://sujeitoprogramador.com/r-api/?api=filmes';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> retorno = json.decode(response.body);
   print(retorno[0]);
     setState(() {
       filmes = retorno;
       });
    }
 
     
  @override
  void initState(){
    super.initState();
    _recuperarFilmes();
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
      title: Text("App de Filmes"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 21, 73, 245),
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _campoFilme(0),
          _campoFilme(1),
          _campoFilme(2),
          _campoFilme(3),
          _campoFilme(4),
          _campoFilme(5),
          _campoFilme(6),
        ],
      ),
    );
  }
 
 
_campoFilme(indice){
return Container(
   padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
   child: Column(
      children: <Widget>[
       Text(
        '${filmes[indice]['nome']}',
        textAlign: TextAlign.center,
        style: TextStyle(color:Colors.black , fontSize: 20.0),
      ),
      Image.network(
      '${filmes[indice]['foto']}',
      height: 400,
      width: 300,
      ),
      _botao(context, indice),
      ],
   ),
    );
  }
 
_botao(BuildContext context, indice) {
    return Container(
        padding: EdgeInsets.only(left: 200.0),
        child: FlatButton(
        color: Colors.white,
        child: Text(
          'Leia mais',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
          ),
        ),
        onPressed: () {
          _onClickTelaSinopse(context, indice);
        }),
    );
  }
 
  
 _onClickTelaSinopse(BuildContext context, indice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
        return Sinopse(valueNome: filmes[indice]['nome'], valueSinopse: filmes[indice]['sinopse']);
      }),
    );
  }
 
}
 
 

 
