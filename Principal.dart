import 'dart:io';
import 'Clientes.dart';
import 'Relatorios.dart'; 
import 'Carros.dart';
import 'Vendas.dart';

class PrincipalManager{
    static late bool StopInicializar;
}
void main() {
    inicializar();
}

void inicializar() {
  limparTela();
  PrincipalManager.StopInicializar = true;
  while (PrincipalManager.StopInicializar) {

    
    print("----------BEM VINDO!----------");
    print("Digite o número da função que deseja realizar:");
    print("1-Acessar área de CLIENTES.");
    print("2-Acessar área de VEÍCULOS.");
    print("3-Acessar área de ESTOQUE.");
    print("4-Acessar área de VENDAS.");
    print("5-Acessar área de RELATÓRIOS.");
    print("6-Sair do sistema.");

    int funcaoEscolhida = int.parse(stdin.readLineSync()!);

    if (funcaoEscolhida < 1 || funcaoEscolhida > 6) {
      print("********************Comando inválido, escolha um número entre 1 e 6!********************");
    } else {
      switch (funcaoEscolhida) {
        case 1:
          print("Você escolheu: ÁREA DE CLIENTES");
          inicializarClientes();
          break; 
        case 2:
          print("Você escolheu: ÁREA DE PRODUTOS");
          mainCarros();
          break;
        case 3:
          print("Você escolheu: ÁREA DE VEÍCULOS EM ESTOQUE");
          listarTudo(); // From Carros.dart
          break;
        case 4:
          print("Você escolheu: ÁREA DE VENDAS");
          mainVenda();
          break;
        case 5:
          print("Você escolheu: ÁREA DE RELATÓRIOS.");
          inicializarRelatorios();
          break;
        case 6: 
          print("Saindo");
          PrincipalManager.StopInicializar=false;
          break;
      }
    }
  }
}

limparTela() {
  print('\x1B[2J\x1b[0;0H');
}
