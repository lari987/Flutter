import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:app23_confeccao_de_crachas/helper/FuncionariosHelper.dart';
import 'package:app23_confeccao_de_crachas/model/Funcionarios.dart';
import 'package:intl/intl.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  File file;
  String path_foto = 'Tire uma foto';
  TextEditingController nomeController = TextEditingController();
  String dropdownArea = 'Administrativa';
  var _db = FuncionarioHelper();
  List<Funcionario> _anotacoes = List<Funcionario>();
 
  _recuperarAnotacoes() async {
    List funcionariosRecuperados = await _db.recuperarAnotacoes();
 
    List<Funcionario> listaTemporaria = List<Funcionario>();
    for (var item in funcionariosRecuperados) {
      Funcionario funcionarios = Funcionario.fromMap(item);
      listaTemporaria.add(funcionarios);
    }
 
    setState(() {
      _anotacoes = listaTemporaria;
    });
    listaTemporaria = null;
 
    print("Lista funcionarios: " + funcionariosRecuperados.toString() );
  }
 
  _salvarAtualizarAnotacao({Funcionario funcionarioSelecionado}) async {
    String foto = path_foto;
    String nome = nomeController.text;
    String area = dropdownArea;
 
    //if (anotacaoSelecionada == null) {
      //salvar
      Funcionario anotacao =
          Funcionario(foto, nome, area);
      int resultado = await _db.salvarAnotacao(anotacao);
     print(resultado);
    /*} else {
      //atualizar
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }
 
    _tituloController.clear();
    _descricaoController.clear();
 */
    _recuperarAnotacoes();
  }
 
  void _getImagemFromCamera() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.camera);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
    });
  }
 
  void _getImagemFromGaleria() async {
    File foto = await ImagePicker.pickImage(source: ImageSource.gallery);
 
    setState(() {
      this.file = foto;
      this.path_foto = foto.toString();
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
      title: Text("Criação de Crachás"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 4, 22, 93),
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _campoFoto(),
          _campo("Nome:", nomeController),
          _campoArea(),
          _botao(),
        ],
      ),
    );
  }

   _campoFoto(){
    return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            file != null
                ? Image.file(file, height: 150)
                : Image.network(
                    "https://static.vecteezy.com/ti/vetor-gratis/p1/1840665-simbolo-homem-e-mulher-simbolo-perfil-humano-icone-ou-icone-pessoa-homem-e-mulher-simbolo-sinal-e-simbolo-gr%C3%A1tis-vetor.jpg",
                    height: 150,
                  ),
            Padding(
               padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
          onPressed: _getImagemFromCamera,
          child: Text("Câmera",
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          color:  Color.fromARGB(255, 7, 246, 138),
                      ),
                      SizedBox(
                    width: 40,
                  ),
                   RaisedButton(
          onPressed: _getImagemFromGaleria,
          child: Text("Galeria",
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          color:  Color.fromARGB(255, 7, 246, 138),
                      ),
                ],
              ),
            ),

          ],
        ),
      );
  }
_verFoto(){
  file != null
                ? Image.file(file, height: 150)
                : Image.network(
                    "https://static.vecteezy.com/ti/vetor-gratis/p1/1840665-simbolo-homem-e-mulher-simbolo-perfil-humano-icone-ou-icone-pessoa-homem-e-mulher-simbolo-sinal-e-simbolo-gr%C3%A1tis-vetor.jpg",
                    height: 150,
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

  _campoArea(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _textoArea(),
            _dropdownArea(),
          ],
        ),
      );
    }

    _textoArea(){
  return Container(
     padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
      child: Text(
        'Área:', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 7, 18, 63), fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
}


 _dropdownArea() {
    return DropdownButton<String>(
        value: dropdownArea,
        items: <String>['Administrativa','Financeira', 'Comercial','Recursos Humanos', 'Operacional']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String valorSelecionado) {
          setState(() {
            dropdownArea = valorSelecionado;
          });
        },
    );
  }

 
  _botao() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _salvarAtualizarAnotacao,
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color:  Color.fromARGB(255, 4, 22, 93),
        ),
      ),
    );
  }
 

}
  