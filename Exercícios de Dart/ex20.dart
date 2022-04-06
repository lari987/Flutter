void main(){
  var nome = ['Rebeca','Melissa','João','Bianca','Miguel'];
var sexo = ['F','F','M','F','M'];
var idade = [22,11,78,34,23];
var vetor = [];

for(var i = 0; i < 5; i++){
  if(sexo[i] == 'F'){
    print('Nome:${nome[i]}');
    print('Sexo:${sexo[i]}');
    print('Idade:${idade[i]}');
  }
}
}