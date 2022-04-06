void main(){
  var v = [0,34,21,7,3,88,45,12,1,76];
  var vetorNovo = [];
  for(var i = 0; i <= 9; i++){
    vetorNovo.add(v[i] * 3);
  }
  for(var a = 0; a <= 9; a++){
    print(vetorNovo[a]);
  }
}