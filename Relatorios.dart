import 'dart:io';
import 'Clientes.dart';
import 'Principal.dart';
import 'Vendas.dart';


void main() {
  inicializarRelatorios();
}

void inicializarRelatorios() {


  bool rodandoRelatorios = true;

  while (rodandoRelatorios) {
    limparTela();
    print("ÁREA DE RELATÓRIOS, ESCOLHA O QUE VOCÊ DESEJA:");
    print("1- Relatório de clientes cadastrados.");
    print("2- Relatório de total de vendas.");
    print("3- Sair");

    int funcaoEscolhida = int.parse(stdin.readLineSync()!);
    if (funcaoEscolhida < 1 || funcaoEscolhida > 3) {
      print("********************Comando inválido, escolha um número entre 1 e 3!********************");
    } else {
      switch (funcaoEscolhida) {
        case 1:
          gravarArquivoClientes();
          rodandoRelatorios = false;
          break;
        case 2:
          gravarArquivoVendas();
          rodandoRelatorios=false;
          break;
        case 3:
          rodandoRelatorios = false;
          break;
      }
    }
  }
}

gravarArquivoClientes() {
  String nomeArquivo = 'lista-clientes.txt';
  File caminhoArquivo = File(nomeArquivo);
  caminhoArquivo.createSync(recursive: true);

  late String informacoes = '';

  ClientesManager.listaDeClientes.forEach((cliente) {
    String nomeCompleto = cliente['nomeCompleto'];
    String cpf = cliente['cpf'];
    String dataNascimento = cliente['dataNascimento'];
    String endereco = cliente['endereco'];
    String telefone = cliente['telefone'];
    int totalClientes = ClientesManager.listaDeClientes.length;

    informacoes += '****************************************\n'
        '********** LISTA DE CLIENTES **********\n'
        '****************************************\n'
        'Nome completo:: $nomeCompleto \n'
        'CPF:: $cpf \n'
        'Data Nascimento: $dataNascimento \n'
        'Endereço: $endereco \n'
        'Telefone: $telefone \n'

        '****************************************\n'
        'Total de clientes: $totalClientes \n'
        '****************************************\n';

    caminhoArquivo.writeAsStringSync(informacoes);
  });
  print('Arquivo gerado com sucesso!!!');
}

gravarArquivoVendas() {
  String nomeArquivo = 'lista-vendas.txt';
  File caminhoArquivo = File(nomeArquivo);
  caminhoArquivo.createSync(recursive: true);

  late String informacoes = '';

  VendasManager.listaVendas.forEach((venda) {
    String nomeCompleto = venda['nomeCompleto'];
    String cpf = venda['cpf'];
    String modelo =venda['modelo'];
    String ano =venda['ano'];
    String litragem =venda['litragem'];
    String versao =venda['versao'];
    int totalvendas = VendasManager.listaVendas.length;


    informacoes += '****************************************\n'
        '********** LISTA DE VENDAS **********\n'
        '****************************************\n'
        'Nome completo:: $nomeCompleto \n'
        'CPF:: $cpf \n'
        'Modelo:: $modelo \n'
        'Ano:: $ano \n'
        'Litragem:: $litragem \n'
        'Versão:: $versao \n'
        '****************************************\n'
        'Total de vendas: $totalvendas \n'
        '****************************************\n';

    caminhoArquivo.writeAsStringSync(informacoes);
  });
  print('Arquivo gerado com sucesso!!!');
}
