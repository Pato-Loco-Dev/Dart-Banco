import 'package:armageddon/armageddon.dart' as armageddon;
import 'dart:io';


class PrincipalManager{
    static late bool stopInicializar;
}

void main() async {

    print("----------Gerenciamento de Veiculos----------");
    print("Digite o número da função que deseja realizar:");
    print("1-Cadastrar um veiculo");
    print("2-Atualizar um veiculo");
    print("3-Listar todos os veiculos");
    print("4-Deletar um veiculo");
    print("5-Sair.");

    int funcaoEscolhida = int.parse(stdin.readLineSync()!);

    if (funcaoEscolhida < 1 || funcaoEscolhida > 5) {
      print("********************Comando inválido, escolha um número entre 1 e 5!********************");
    } else {
      switch (funcaoEscolhida) {
        case 1:
          
          print("Você escolheu: Cadastrar um veiculo.");
          await armageddon.adicionarVeiculos();
          pergunta();
          break;
        case 2:
          
          print("Você escolheu: Atualizar um veiculo.");
          await armageddon.atualizarVeiculos();
          pergunta();
          break;
        case 3:
          
          print("Você escolheu: Listar todos os veiculos.");
          await armageddon.consultarVeiculos();
          pergunta();
          break;
        case 4:
          
          print("Você escolheu: Deletar um veiculo.");
          await armageddon.deletarVeiculos();
          pergunta();
          break;
        case 5:
          break;
      }
    }
}

void pergunta() {

  print("Deseja realizar mais alguma ação?\n1-Sim\n2-Não");
  
  int?  continuar = int.parse(stdin.readLineSync()!);
  
  if (continuar == 1) {
    main();
  }
}


limparTela() {
  print('\x1B[2J\x1b[0;0H');
}

