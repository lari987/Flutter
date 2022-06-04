class Funcionario {
  int id;
  String foto;
  String nome;
  String area;
 
 
  Funcionario(this.foto, this.nome, this.area);
 
  Funcionario.fromMap(Map map) {
    this.id = map["id"];
    this.foto = map['foto'];
    this.nome = map["nome"];
    this.area = map["area"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "foto": this.foto,
      "nome": this.nome,
      "area": this.area,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
