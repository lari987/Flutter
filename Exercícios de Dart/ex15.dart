void main(){
  var x = 1;
  var aux;
  var quant = 20;
  
  for (var i = 1; i <= quant+quant; i++) {
   
    if(i % 2 != 0){
      aux = x + i;
      x = aux;
      print(aux);
    }
   
}
}