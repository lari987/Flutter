import 'package:flutter/material.dart';
import 'package:app15_lista_de_tarefas_sqlite/helper/AnotacaoHelper.dart';
import 'package:app15_lista_de_tarefas_sqlite/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  TextEditingController _tituloController = TextEditingController();
  var _db = AnotacaoHelper();
  List<Anotacao> _anotacoes = List<Anotacao>();
 
  _exibirTelaCadastro({Anotacao anotacao}) {
    String textoSalvarAtualizar = "";
    if (anotacao == null) {
      //salvando
      _tituloController.text = "";
      textoSalvarAtualizar = "Salvar";
    } else {
      //atualizar
      _tituloController.text = anotacao.titulo;
      textoSalvarAtualizar = "Atualizar";
    }
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("$textoSalvarAtualizar Tarefa"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _tituloController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "", hintText: "Nome da Tarefa"),
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
                    _salvarAtualizarAnotacao(anotacaoSelecionada: anotacao);
 
                    Navigator.pop(context);
                  },
                  child: Text(textoSalvarAtualizar))
            ],
          );
        });
  }
 
  _recuperarAnotacoes() async {
    List anotacoesRecuperadas = await _db.recuperarAnotacoes();
 
    List<Anotacao> listaTemporaria = List<Anotacao>();
    for (var item in anotacoesRecuperadas) {
      Anotacao anotacao = Anotacao.fromMap(item);
      listaTemporaria.add(anotacao);
    }
 
    setState(() {
      _anotacoes = listaTemporaria;
    });
    listaTemporaria = null;
 
    //print("Lista anotacoes: " + anotacoesRecuperadas.toString() );
  }
 
  _salvarAtualizarAnotacao({Anotacao anotacaoSelecionada}) async {
    String titulo = _tituloController.text;
 
    if (anotacaoSelecionada == null) {
      //salvar
      Anotacao anotacao =
          Anotacao(titulo);
      int resultado = await _db.salvarAnotacao(anotacao);
    } else {
      //atualizar
      anotacaoSelecionada.titulo = titulo;
      int resultado = await _db.atualizarAnotacao(anotacaoSelecionada);
    }
 
    _tituloController.clear();
   
    _recuperarAnotacoes();
  }
 
 
  _removerAnotacao(int id) async {
    await _db.removerAnotacao(id);
 
    _recuperarAnotacoes();
  }
 
  @override
  void initState() {
    super.initState();
    _recuperarAnotacoes();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarefas"),
        backgroundColor: Color.fromARGB(255, 91, 32, 242),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _anotacoes.length,
                  itemBuilder: (context, index) {
                    final anotacao = _anotacoes[index];
 
                    return Card(
                      child: ListTile(
                        title: Text(anotacao.titulo),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _exibirTelaCadastro(anotacao: anotacao);
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
                                _removerAnotacao(anotacao.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.pinkAccent,
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
          backgroundColor:Color.fromARGB(255, 81, 32, 242),
          foregroundColor: Colors.white,
          child: Icon(Icons.add_task),
          onPressed: () {
            _exibirTelaCadastro();
          }),
    );
  }
}