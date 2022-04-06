void main() {
  var genero = "F";
  var peso = 46;
  var altura = 1.55;
  
  var p = peso/(altura*altura);
  var pesofinal = p.toStringAsFixed(2);
  
  print("o peso é $pesofinal");
  
  switch(genero){
    case "F": 
      if (p < 19){
        print("está abaixo do peso!");
      }else if (p >= 19 && p <= 24){
        print("está com peso ideal!");
      }else{
        print("está acima do peso!");
      }
      break;
    case "M": 
      if (p < 20){
        print("está abaixo do peso!");
      }else if (p >= 19 && p <= 25){
        print("está com peso ideal!");
      }else{
        print("está acima do peso!");
      }
      break;
  }
}