void main(){
  var n1 = 1;
  var n2 = 1;
  var n3 = 1;
  
  print('$n1'); 
  print('$n2');
  print('$n3');
  for (int i = 1; i <= 20; i++) {
    var n4 = n1 + n2 + n3;
    n1 = n2;
    n2 = n3;
    n3 = n4;
    print ('$n4');
  }
}