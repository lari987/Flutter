import 'package:flutter/material.dart';
 
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
 
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
   

  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  
  String resultadoNome = "";
  String resultadoIdade = "";
  String dropdownSexo = "Selecione o seu sexo";
  String sexo = "";
  String dropdownEscolaridade = "Selecione a sua escolaridade";
  String escolaridade = "";
  double sliderLimite = 0;
  String limite = "";
  bool switchNacionalidade = false;
  String nacionalidade = "";
  String informacoes = "";
  
  
 void _calcular() {
    setState(() {
      String nome = (n1Controller.text);
      double idade = double.parse(n2Controller.text);

      informacoes = 'Informações de $nome';
      resultadoNome = 'Nome: $nome';
      resultadoIdade = 'Idade: $idade anos';
      sexo = 'Sexo: $dropdownSexo';
      escolaridade = 'Escolaridade: $dropdownEscolaridade';
      limite = 'Limite de Conta: R\$$sliderLimite';
      if(switchNacionalidade =! false)
      nacionalidade = 'Nacionalidade: Brasileira(o)';
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
      title: Text("Formulario de Abertura de Conta Bancária"),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 91, 11, 240),
    );
  }
 
        _corpo(){
          return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _campoFoto(),
          _campo("Nome:", n1Controller),
          _campo("Idade:", n2Controller),
          _campoSexo(),
          _campoEscolaridade(),
          _campoLimite(),
          _campoNacionalidade(),
          _button(),
          _informacoes(),
          _textNome(),
          _textIdade(),
          _textoDropdownSexo(),
          _textoDropdownEscolaridade(),
          _textoSlider(),
          _textoSwitch(),
        ],
      ),
    );

  }

   _campoFoto() {
    return Container(
    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
            _foto(),
          ],
        ),
      );
    }
    
    _foto() {
    return Image.network(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkvfmkWx-RAZXxdbxy5zb7rbrt5Bl8fmtbKYI9fR_ny19j6tygGpz-1TMRbx_MlWAhhko&usqp=CAU',
      //height: 300,
      //width: 300,
    );
  }


         
 _campoSexo(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _infSexo(),
            _dropdownSexo(),
          ],
        ),
      );
    }

  _campoEscolaridade(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _infEscolaridade(),
            _dropdownEscolaridade(),
          ],
        ),
      );
    }

_campoLimite(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _infLimite(),
            _sliderLimite(),
          ],
        ),
      );
    }

    _campoNacionalidade(){
   return SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(0.0, 0, 10.0, 0.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _infNacionalidade(),
            _switch(),
          ],
        ),
      );
    }

_infSexo(){
  return Container(
      child: Text(
        'Sexo:  ', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    );
}

_infEscolaridade(){
  return Container(
      child: Text(
        'Escolaridade:  ', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    );
}

_infLimite(){
  return Container(
      child: Text(
        'Limite da Conta: ', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    );
}

_infNacionalidade(){
  return Container(
      child: Text(
        'Você é brasileiro? ', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
      ),
    );
}

  _campo(labelTitulo, objController) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          labelText: labelTitulo, labelStyle: TextStyle(color: Colors.black, fontSize: 16.0)),
      textAlign: TextAlign.start,
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      controller: objController,
    );
  }
 _dropdownSexo() {
    return DropdownButton<String>(
      value: dropdownSexo,
      items: <String>['Selecione o seu sexo','Feminino', 'Masculino']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownSexo = valorSelecionado!;
        });
      },
    );
  }

  _dropdownEscolaridade() {
    return DropdownButton<String>(
      value: dropdownEscolaridade,
      items: <String>
['Selecione a sua escolaridade',
 'Fundamental - Incompleto',
 'Fundamental - Completo',
 'Médio - Incompleto', 'Médio - Completo', 
 'Superior - Incompleto', 
 'Superior - Completo', 
 'Pós-graduação (Lato senso) - Incompleto',
 'Pós-graduação (Lato senso) - Completo',
 'Pós-graduação (Stricto sensu, nível mestrado) - Incompleto',
 'Pós-graduação (Stricto sensu, nível mestrado) - Completo',
 'Pós-graduação (Stricto sensu, nível doutor) - Incompleto',
 'Pós-graduação (Stricto sensu, nível doutor) - Completo']
          .map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? valorSelecionado) {
        setState(() {
          dropdownEscolaridade = valorSelecionado!;
        });
      },
    );
  }

  _sliderLimite() {
    return Slider(
      value: sliderLimite,
      min: 0,
      max: 500,
      divisions: 10,
      label: sliderLimite.round().toString(),
      onChanged: (double value) {
        setState(() {
          sliderLimite = value;
        });
      },
    );
  }
_switch() {
    return Switch(
      value: switchNacionalidade,
      onChanged: (value) {
        setState(() {
          switchNacionalidade = value;
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.blue,
      
    );
  }
  _informacoes(){
return Container(
   padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        informacoes, 
        textAlign: TextAlign.start,
        style: TextStyle(color:Color.fromARGB(255, 91, 11, 240) , fontSize: 25.0, fontStyle: FontStyle.italic),
      ),
    );
  }
  
    
     _textNome() {
    return Container(
      child: Text(
        resultadoNome, 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0, fontStyle: FontStyle.italic),
      ),
    );
  }

   _textIdade() {
    return Container(
      child: Text(
        '$resultadoIdade', 
        textAlign: TextAlign.start,
        style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0, fontStyle: FontStyle.italic),
      ),
    );
  }
  
  _textoDropdownSexo() {
    return Text(
      sexo,
      textAlign: TextAlign.start,
      style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0, fontStyle: FontStyle.italic),
    );
  }

  _textoDropdownEscolaridade() {
    return Text(
      escolaridade,
      textAlign: TextAlign.start,
      style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0, fontStyle: FontStyle.italic),
    );
  }
 
 _textoSlider() {
    return Text(
      '$limite',
          style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0, fontStyle: FontStyle.italic),
    );
  }

_textoSwitch() {
    return Text(
      nacionalidade,
     style: TextStyle(color: Color.fromARGB(255, 246, 107, 7), fontSize: 25.0, fontStyle: FontStyle.italic),
    //)
    );
  }

  
   _button() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
      child: Container(
        height: 50.0,
        child: RaisedButton(
          onPressed: _calcular,
          child: Text("Confirmar",
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          color:  Color.fromARGB(255, 246, 107, 7),
        ),
      ),
    );
  }
 
}
