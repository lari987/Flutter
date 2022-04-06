
  class conta{ 
   
      var numero;
      var saldo;
      var limite;
      var nome;
      var verif;
      
      
      conta(var n, var s, var l, var nome){
                
				numero=n; 
        saldo=s; 
        limite=l;
        this.nome=nome;
        
        }
   
    void saque(var valor){
      if (saldo + limite < valor) {
            verif = 0;
       			print('$nome não pode sacar!');
     	}
     		else {
       			saldo = saldo - valor;
            verif = 1;
       			print('$nome retirou $valor da sua conta, e seu saldo agora é $saldo');
            
     	}
    }
   
   void deposito(var valor){
     		saldo = saldo + valor;
     		print('$nome depositou $valor na sua conta, e agora seu saldo é $saldo');
   }
   
   bool transferencia(conta contaPoupanca, var valor){
    		if (verif == 0) {
      			return false;
    		}
    		else {
      			contaPoupanca.deposito(valor);
      			return true;
    		}
   }
   
  }

 class contaCorrente extends conta{
   contaCorrente(var numero,var saldo,var limite,var nome):super(numero,saldo,limite,nome);
 }
 class contaPoupanca extends conta{
   contaPoupanca(var numero,var saldo,var limite,var nome):super(numero,saldo,limite,nome);
 }
  void main(){

  
    contaCorrente contaPaulo = new contaCorrente(236,1000, 100, "Paulo"); 
	  contaPaulo.saque(200);
    contaPaulo.deposito(350);
    contaPoupanca contaSara = new contaPoupanca(237,2000, 100, "Sara");
    
    if(contaPaulo.transferencia(contaSara,1200) != 0){
			print("Tranferencia realizada \n");
	}
			
	else{
		print("Transferencia não realizada \n");
	}
  }
