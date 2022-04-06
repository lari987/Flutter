void main() {
  var ant = 0;
  var prox = 1;
  
  print('$ant'); 
   print('$prox'); 
  for (int i = 1; i <= 30; i++) {
    var aux = ant + prox;
    ant = prox;
    prox = aux;
    print ('$aux');
  }  
}