void main(){
  var v = [0,34,21,7,3,88,100,12,1,76];
    var maior;
  for(var y = 0; y <= 9; y++){
    
    if(y == 0){
    maior = v[y];
    }else if (maior < v[y]){
      maior = v[y];
    }
  }
  print(maior);
}