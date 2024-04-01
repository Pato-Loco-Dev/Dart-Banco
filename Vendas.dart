import 'Carros.dart';
import 'Clientes.dart';
import 'dart:io';

class VendasManager{
static List<Map<String, dynamic>> listaVendas = [];
}

mainVenda(){    


    print("----------Controle de Vendas----------");
    print("Digite o número da função que deseja realizar:");
    print("1-Realizar uma venda");
    print("2-Sair.");

    int funcaoEscolhida = int.parse(stdin.readLineSync()!);

    if (funcaoEscolhida < 1 || funcaoEscolhida > 2) {
      print("********************Comando inválido, escolha entre o número 1 ou 2!********************");
    } else {
      switch (funcaoEscolhida) {
        case 1:
          print("Você escolheu: Realizar uma venda.");
          novaVenda();
          break;
        case 2:
          print("Saindo.");
          break;
      }
    }

}

novaVenda() {

  Map<String, dynamic> venda = {};
  
  print('\x1B[2J\x1B[0;0H');
  print('\x1B[2J\x1B[0;0H');
  print('--------------------------');
  if (CarrosManager.listaCarros.isEmpty) {
    print("Desculpe, não há veiculos cadastrados.");
    return;
  }else {
    print('Selecione o veiculo:');
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
  if (ClientesManager.listaDeClientes.isEmpty) {
    print("Desculpe, não há clientes cadastrados.");
    return;
  }
  int veiculoSelec = int.parse(stdin.readLineSync()!);
  print("Selecione o cliente:");
  for (int i = 0; i < ClientesManager.listaDeClientes.length; i++) {
    print("Cliente ${i}:");
    print("Nome Completo: ${ClientesManager.listaDeClientes[i]['nomeCompleto']}");
    print("CPF: ${ClientesManager.listaDeClientes[i]['cpf']}");
    print("Data de Nascimento: ${ClientesManager.listaDeClientes[i]['dataNascimento']}");
    print("Endereço: ${ClientesManager.listaDeClientes[i]['endereco']}");
    print("Telefone: ${ClientesManager.listaDeClientes[i]['telefone']}");
    print("--------------------");
  }

  int clienteSelec = int.parse(stdin.readLineSync()!);
  venda['modelo'] = CarrosManager.listaCarros[veiculoSelec]['modelo'];
  venda['ano'] = CarrosManager.listaCarros[veiculoSelec]['ano'];
  venda['litragem'] = CarrosManager.listaCarros[veiculoSelec]['litragem'];
  venda['versao'] = CarrosManager.listaCarros[veiculoSelec]['versao'];
  venda['valor'] = CarrosManager.listaCarros[veiculoSelec]['valor'];
  venda['nomeCompleto'] = ClientesManager.listaDeClientes[clienteSelec]['nomeCompleto'];
  venda['cpf'] = ClientesManager.listaDeClientes[clienteSelec]['cpf'];
  venda['dataNascimento'] = ClientesManager.listaDeClientes[clienteSelec]['dataNascimento'];
  venda['endereco'] = ClientesManager.listaDeClientes[clienteSelec]['endereco'];
  venda['telefone'] = ClientesManager.listaDeClientes[clienteSelec]['telefone'];

  VendasManager.listaVendas.add(venda);
  CarrosManager.listaCarros.removeAt(veiculoSelec);
  

  for (int i = 0; i < VendasManager.listaVendas.length; i++) {
    print("--------------------Venda ${i + 1} --------------------");
    print("Modelo: ${VendasManager.listaVendas[i]['modelo']}");
    print("Ano: ${VendasManager.listaVendas[i]['ano']}");
    print("Litragem: ${VendasManager.listaVendas[i]['litragem']}");
    print("Versao: ${VendasManager.listaVendas[i]['versao']}");
    print("Nome Completo: ${VendasManager.listaVendas[i]['nomeCompleto']}");
    print("CPF: ${VendasManager.listaVendas[i]['cpf']}");
    print("Data Nascimento: ${VendasManager.listaVendas[i]['dataNascimento']}");
    print("Enderço: ${VendasManager.listaVendas[i]['endereco']}");
    print("Telefone: ${VendasManager.listaVendas[i]['telefone']}");
    print("--------------------------------------------------------");
}
print("Venda realizada.");
print('Deseja realizar mais uma venda?\n1-Sim\n2-Não');
int? choiceVenda = int.parse(stdin.readLineSync()!);

if(choiceVenda == 1) {
  mainVenda();
} else{
  return;
}


}
