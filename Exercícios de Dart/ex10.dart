void main() {
  var v0 = 30;
  var a = 20;
  var t = 4;
  
  var v = v0 + a * t;
  
  print("a velocidade é $v \m/s");
  
    if (v <= 40){
        print("veiculo muito lento!");
      }else if (v > 40 && v <= 60){
        print("velocidade permitida!");
      }else if (v > 60 && v <= 80){
        print("velocidade de cruzamento!");
      }else if (v > 80 && v <= 120){
        print("veiculo rapido!");
      }else{
        print("veiculo muito rapido");
      }
}