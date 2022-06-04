import 'package:app23_confeccao_de_crachas/model/Funcionarios.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
 
class FuncionarioHelper {
  static final String nomeTabela = "funcionario";
 
  static final FuncionarioHelper _funcionarioHelper = FuncionarioHelper._internal();
  Database _db;
 
  factory FuncionarioHelper() {
    return _funcionarioHelper;
  }
 
  FuncionarioHelper._internal() {}
 
  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }
 
  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "foto TEXT, "
        "nome VARCHAR, "
        "area TEXT)";
    await db.execute(sql);
  }
 
  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados =
        join(caminhoBancoDados, "banco_meus_funcionarios.db");
 
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }
 
  Future<int> salvarAnotacao(Funcionario funcionario) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(nomeTabela, funcionario.toMap());
    return resultado;
  }
 
  recuperarAnotacoes() async {
    var bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY nome";
    List funcionarios = await bancoDados.rawQuery(sql);
    return funcionarios;
  }
 
  Future<int> atualizarAnotacao(Funcionario funcionario) async {
    var bancoDados = await db;
    return await bancoDados.update(nomeTabela, funcionario.toMap(),
        where: "id = ?", whereArgs: [funcionario.id]);
  }
 
  Future<int> removerAnotacao(int id) async {
    var bancoDados = await db;
    return await bancoDados
        .delete(nomeTabela, where: "id = ?", whereArgs: [id]);
  }
}



