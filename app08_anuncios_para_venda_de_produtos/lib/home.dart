import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {

  

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _titulo(),
        backgroundColor: Colors.white,
        body: _carroselCorpo(),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("S H E I N"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }
 
 _carroselCorpo() {
    return Container(
      width: double.infinity,
      //margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: PageView(
        children: <Widget>[
          _corpo1(),
          _corpo2(),
          _corpo3(),
        ],
      ),
    );
  }
 
  _corpo1() {
    return Container(
      padding: EdgeInsets.only( top: 10.0, bottom: 10.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _tituloPag1(),
            _foto1(),
            _precoRoupa1(),
            _tamanhoRoupa1(),
            _buttonRoupa1(),
          ],
        ),
    );
  }

_corpo2() {
    return Container(
      padding: EdgeInsets.only( top: 10.0, bottom: 10.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _tituloPag2(),
            _foto2(),
            _precoRoupa2(),
            _tamanhoRoupa2(),
            _buttonRoupa2(),
          ],
        ),
    );
  }

 _corpo3() {
    return Container(
      padding: EdgeInsets.only( top: 10.0, bottom: 10.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _tituloPag3(),
            _foto3(),
            _precoRoupa3(),
            _tamanhoRoupa3(),
            _buttonRoupa3(),
          ],
        ),
    );
  } 
 
 

 
  _foto1() {
    return Image.asset(
      "assets/images/imagem1.jpg",
      height: 300,
      width: 300, 
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      //fit: BoxFit.cover,
    );
  }
 
  _tituloPag1() {
    return Container(
      padding: EdgeInsets.only( bottom: 20.0),
      child: Text(
      "Cropped Branco com Borboleta",
      style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          //fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
      )
      ),
    );
  }

  _precoRoupa1() {
    return Container(
      padding: EdgeInsets.only( top: 20.0, bottom: 10.0),
      child: Text(
      "Preço: R\$39,90",
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
      )
      ),
    );
  }
  _tamanhoRoupa1(){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
      "Tamanhos:  PP  P   M   G",
      style: TextStyle(
          color: Colors.black,
          fontSize: 16,
      )
      ),
    );
  }

  _buttonRoupa1() {
    return RaisedButton(
      color: Colors.black,
      onPressed: onClick,
      child: Text(
        "Comprar Agora!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
 
  onClick() {
    print("A pessoa quer comprar!");
  }

  _foto2() {
    return Image.asset(
      "assets/images/imagem2.jpg",
      height: 300,
      width: 300,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      //fit: BoxFit.cover,
    );
  }
 
  _tituloPag2() {
    return Container(
      padding: EdgeInsets.only( bottom: 20.0),
      child: Text(
      "Vestido Lilás de Mangas Bufantes",
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          decoration: TextDecoration.underline,
      )
      ),
    );
  }

  _precoRoupa2() {
    return Container(
      padding: EdgeInsets.only( top: 20.0, bottom: 10.0),
      child: Text(
      "Preço: R\$145,80",
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
      )
      ),
    );
  }

  _tamanhoRoupa2(){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
      "Tamanhos:  PP  P   M   G",
      style: TextStyle(
          color: Colors.black,
          fontSize: 16,
      )
      ),
    );
  }

  _buttonRoupa2() {
    return RaisedButton(
      color: Colors.black,
      onPressed: onClick,
      child: Text(
        "Comprar Agora!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
 
   _foto3() {
    return Image.asset(
      "assets/images/imagem3.jpg",
      height: 300,
      width: 300,
      //fit: BoxFit.fill,
      //fit: BoxFit.contain,
      //fit: BoxFit.cover,
    );
  }
 
  _tituloPag3() {
    return Container(
      padding: EdgeInsets.only( bottom: 20.0),
      child: Text(
      "Conjunto Cute Esportivo",
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
           decoration: TextDecoration.underline,
      )
      ),
    );
  }

  _precoRoupa3() {
    return Container(
      padding: EdgeInsets.only( top: 20.0, bottom: 10.0),
      child: Text(
      "Preço: R\$76,50",
      //"Tamanho: PP  P  M  G",
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
      )
      ),
    );
  }

  _tamanhoRoupa3(){
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
      "Tamanhos:  PP  P   M   G",
      style: TextStyle(
          color: Colors.black,
          fontSize: 16,
      )
      ),
    );
  }

  _buttonRoupa3() {
    return RaisedButton(
      color: Colors.black,
      onPressed: onClick,
      child: Text(
        "Comprar Agora!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
 
  
}


