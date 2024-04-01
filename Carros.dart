import 'dart:io';
import 'Principal.dart';

class CarrosManager {
  static List<Map<String, dynamic>> listaCarros = [];
}

void mainCarros() {
  limparTela();
  bool rodando = true;
  while (rodando) {
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
          limparTela();
          print("Você escolheu: Cadastrar um veiculo.");
          cadastrar();
          break;
        case 2:
          limparTela();
          print("Você escolheu: Atualizar um veiculo.");
          atualizar();
          break;
        case 3:
          limparTela();
          print("Você escolheu: Listar todos os veiculos.");
          listarTudo();
          break;
        case 4:
          limparTela();
          print("Você escolheu: Deletar um veiculo.");
          deletar();
          break;
        case 5:
          limparTela();
          print("Saindo.");
          rodando = false;
          break;
      }
    }
  }
}

void cadastrar() {
  Map<String, dynamic> cadastro = {};
  print('\x1B[2J\x1B[0;0H');
  print('\x1B[2J\x1B[0;0H');
  print('--------------------------');
  print('Digite o modelo: ');
  cadastro['modelo'] = stdin.readLineSync();

  print('Digite o ano: ');
  cadastro['ano'] = stdin.readLineSync();

  print('Digite a litragem: ');
  cadastro['litragem'] = stdin.readLineSync();

  print('Digite a versão: ');
  cadastro['versao'] = stdin.readLineSync();

  print('Digite o valor: ');
  cadastro['valor'] = stdin.readLineSync();

  CarrosManager.listaCarros.add(cadastro);
}

void atualizar() {
  if (CarrosManager.listaCarros.isEmpty) {
    print("Não há carros cadastrados para atualizar.");
    return;
  }

  print("Digite o índice do carro que deseja atualizar:");
  for (int i = 0; i < CarrosManager.listaCarros.length; i++) {
    print("$i: ${CarrosManager.listaCarros[i]['modelo']}");
  }

  int indiceCarro = int.parse(stdin.readLineSync()!);

  if (indiceCarro < 0 || indiceCarro >= CarrosManager.listaCarros.length) {
    print("Índice inválido.");
    return;
  }

  print('Qual informação deseja alterar?');
  print('1-Modelo\n2-Ano\n3-Litragem\n4-Versão\n5-Valor\n6-Todos\n7-Voltar');
  int? choiceAtualizar = int.parse(stdin.readLineSync()!);

  switch (choiceAtualizar) {
        case 1:
          print("Digite o novo Modelo:");
          CarrosManager.listaCarros[indiceCarro]['modelo'] = stdin.readLineSync();
          break;
        case 2:
          print("Digite o novo Ano:");
          CarrosManager.listaCarros[indiceCarro]['ano'] = stdin.readLineSync();
          break;
        case 3:
          print("Digite a nova Litragem:");
          CarrosManager.listaCarros[indiceCarro]['litragem'] = stdin.readLineSync();
          break;
        case 4:
          print("Digite a nova versão:");
          CarrosManager.listaCarros[indiceCarro]['versao'] = stdin.readLineSync();
          break;
        case 5:
          print("Digite o novo Valor:");
          CarrosManager.listaCarros[indiceCarro]['valor'] = stdin.readLineSync();
          break;
        case 6:
          print("Digite o novo Modelo:");
          CarrosManager.listaCarros[indiceCarro]['modelo'] = stdin.readLineSync();

          print("Digite o novo Ano:");
          CarrosManager.listaCarros[indiceCarro]['ano'] = stdin.readLineSync();
          
          print("Digite a nova Litragem:");
          CarrosManager.listaCarros[indiceCarro]['litragem'] = stdin.readLineSync();

          print("Digite a nova versão:");
          CarrosManager.listaCarros[indiceCarro]['versao'] = stdin.readLineSync();

          print("Digite o novo Valor:");
          CarrosManager.listaCarros[indiceCarro]['valor'] = stdin.readLineSync();
      }

    print('Veiculo atualizado com sucesso!');
}

void listarTudo() {
  if (CarrosManager.listaCarros.isEmpty) {
    print("Não há veiculos cadastrados.");
    return;
  }else {
    print("Veiculos cadastrados:");
  for (int i = 0; i < CarrosManager.listaCarros.length; i++) {
    print("Carro ${i}:");
    print("Modelo: ${CarrosManager.listaCarros[i]['modelo']}");
    print("Ano: ${CarrosManager.listaCarros[i]['ano']}");
    print("Litragem: ${CarrosManager.listaCarros[i]['litragem']}");
    print("versao: ${CarrosManager.listaCarros[i]['versao']}");
    print("Valor: ${CarrosManager.listaCarros[i]['valor']}");
    print("--------------------");

    
  }
  }
}

void deletar() {
  if (CarrosManager.listaCarros.isEmpty) {
    print("Não há veiculos para deletar.");
    return;
  }

  print("Digite o índice do veiculo que deseja deletar:");
  for (int i = 0; i < CarrosManager.listaCarros.length; i++) {
    print("$i: ${CarrosManager.listaCarros[i]['modelo']}");
  }

  int indiceCarro= int.parse(stdin.readLineSync()!);

  if (indiceCarro < 0 || indiceCarro >= CarrosManager.listaCarros.length) {
    print("Índice inválido.");
    return;
  }

  CarrosManager.listaCarros.removeAt(indiceCarro);
  print("Veiculo removido com sucesso.");
}
