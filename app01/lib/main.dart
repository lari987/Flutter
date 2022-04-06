import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { //que herda da classe stateless
  const MyApp({ Key? key }) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.purple
      ),
      home: widgetHome(),
    );
  }
}


widgetHome(){
      return Scaffold(
      appBar: AppBar(
          title: Text("App Hello"),
          backgroundColor: Colors.purple,
        ),
        body: Container(
        color: Colors.amber,
        child: Center(
          child: Text("Hello Larissa!",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},backgroundColor: Colors.purple),
    );
  }
