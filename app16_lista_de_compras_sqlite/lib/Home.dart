import 'package:flutter/material.dart';
import 'package:app16_lista_de_compras_sqlite/helper/MercadoriaHelper.dart';
import 'package:app16_lista_de_compras_sqlite/model/Mercadoria.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  var _db = MercadoriaHelper();
  List<Mercadoria> _mercadorias = List<Mercadoria>();
 
  _exibirTelaCadastro({Mercadoria mercadoria}) {
    String textoSalvarAtualizar = "";
    if (mercadoria == null) {
      //salvando
      _nomeController.text = "";
      _quantidadeController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _nomeController.text = mercadoria.nome;
      _nomeController.text = mercadoria.quantidade;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar Mercadoria"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _nomeController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Nome", hintText: ""),
                ),
                TextField(
                  controller: _quantidadeController,
                  decoration: InputDecoration(
                      labelText: "Quantidade", hintText: ""),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    //salvar
                    _salvarAtualizarMercadoria(mercadoriaSelecionada: mercadoria);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarMercadoria() async {
    List mercadoriasRecuperadas = await _db.recuperarMercadoria();
 
    List<Mercadoria> listaTemporaria = List<Mercadoria>();
    for (var item in mercadoriasRecuperadas) {
      Mercadoria mercadoria= Mercadoria.fromMap(item);
      listaTemporaria.add(mercadoria);
    }
 
    setState(() {
      _mercadorias = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }
 
  _salvarAtualizarMercadoria({Mercadoria mercadoriaSelecionada}) async {
    String nome = _nomeController.text;
    String quantidade = _quantidadeController.text;
 
    if (mercadoriaSelecionada == null) {
      //salvar
      Mercadoria mercadoria =
          Mercadoria(nome,quantidade);
      int resultado = await _db.salvarMercadoria(mercadoria);
    } else {
      //atualizar
      mercadoriaSelecionada.nome = nome;
      mercadoriaSelecionada.quantidade = quantidade;
      int resultado = await _db.atualizarMercadoria(mercadoriaSelecionada);
    }
 
    _nomeController.clear();
    _quantidadeController.clear();

    _recuperarMercadoria();
  }
 
 
  _removerMercadoria(int id) async {
    await _db.removerMercadoria(id);
 
    _recuperarMercadoria();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarMercadoria();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Compras"),
        backgroundColor: Color.fromARGB(255, 242, 98, 32),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _mercadorias.length,
                  itemBuilder: (context, index) {
                    final mercadoria = _mercadorias[index];
 
                    return Card(
                      child: ListTile(
                        title: Text("${(mercadoria.nome)} (${mercadoria.quantidade})"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(mercadoria: mercadoria);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 14, 206, 33)
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _removerMercadoria(mercadoria.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.delete,
                                  color:Color.fromARGB(255, 242, 32, 32),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 242, 98, 32),
          foregroundColor: Colors.white,
          child: Icon(Icons.add_task),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}