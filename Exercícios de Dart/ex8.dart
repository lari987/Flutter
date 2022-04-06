void main() {
  var l1 = 12;
  var l2 = 12;
  var l3 = 10;
  var aux;
  
  print("com essas medidas dá para formar um triangulo?");
  
  if (l1 + l2 > l3 && l1 + l3 > l2 && l3 + l2 > l1){
    aux = 1;
    print("SIM! : ) ");
  }
  else{
    aux = 0;
    print("NÃO! : (");
  }
  
  if(aux == 1){
  print("---------------------------------");
  print("Que tipo de triangulo é?");
  
  if (l1 == l2 && l2 == l3){
    print("Equilátero");
  }
  else if (l1 == l2 && l2 != l3){
    print("Isosceles");
  }
  else{ 
    print("Escaleno");
  }
  }
}