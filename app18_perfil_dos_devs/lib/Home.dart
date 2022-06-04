import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController loginController = TextEditingController();
  String info_login = '';
  String imagem = 'https://cdn-icons-png.flaticon.com/512/25/25231.png';
 
  _recuperarLogin() async {
    String url = 'https://api.github.com/users/${loginController.text}';
 
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
 
   setState(() {
      int id = retorno["id"];
      String nome = retorno["name"];
      int repositorios = retorno["public_repos"];
      String criacao = retorno["created_at"];
      int seguidores = retorno["followers"];
      int seguindo = retorno["following"];
      imagem = retorno["avatar_url"];

      info_login =
          'Id: $id\nNome: $nome\nRepositórios: $repositorios\nCriado em: $criacao\nSeguidores: $seguidores\nSeguindo: $seguindo';
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
      title: Text("Perfil dos devs"),
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
      controller: loginController,
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
        info_login, 
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
          color: Color.fromARGB(255, 78, 212, 15),
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
      imagem,
      height: 200,
      width: 200,
    );

}
 
}