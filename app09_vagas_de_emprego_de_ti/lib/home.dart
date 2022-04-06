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
        backgroundColor: Color.fromARGB(255, 155, 49, 49),
        body: _corpo(),
      ),
    );
  }
 
  _titulo() {
    return AppBar(
      title: Text("Jobs IT"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 235, 75, 75),
    );
  }
 
  _corpo() {
    return Container(
      child: ListView(
        children: <Widget>[
          _foto('imagem1.jpg'),
          _foto('imagem2.jpg'),
          _foto('imagem3.jpg'),
        ],
      ),
    );
  }
 
  _foto(String nomeFoto) {
    return Image.asset(
      "assets/images/$nomeFoto",
    );
  }

}



