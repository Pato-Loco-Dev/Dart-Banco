import 'package:mysql_client/mysql_client.dart';
import 'dart:io';
import 'dart:async';


Future<void> adicionarVeiculos() async {
  final conn = await MySQLConnection.createConnection(
      host: "localhost", 
      port: 3306, 
      userName: "root", 
      password: "va34q4tk", 
      databaseName: "BancoSQL", 
    );
await conn.connect();

print('Digite a fabricante do veiculo:');
String? fabricante = stdin.readLineSync();

print('Digite o modelo do veiculo:');
String? modelo = stdin.readLineSync();

print('Digite o ano do veiculo:');
String? ano = stdin.readLineSync();

print('Digite o motor do veiculo:');
String? motor = stdin.readLineSync();

print('Digite a litragem do veiculo:');
String? litragem = stdin.readLineSync();

print('Digite cor do veiculo:');
String? cor = stdin.readLineSync();

print('Digite o valor do veiculo:');
String? valor = stdin.readLineSync();


if(conn.connected){
  var result = await conn.execute("INSERT INTO VEICULOS (FABRICANTE, MODELO, ANO, MOTOR, LITRAGEM, COR, VALOR) VALUES (:fabricante, :modelo, :ano, :motor, :litragem, :cor, :valor)",
    {
      "fabricante": fabricante,
      "modelo": modelo,
      "ano": ano,
      "motor": motor,
      "litragem": litragem,
      "cor": cor,
      "valor": valor,
    },);

  print('Veiculo adicionado!');
  conn.close();
  
  } else {
    print('Não foi possível se conectar ao banco de dados!');
  }
  
}

Future<void> consultarVeiculos() async {
    
  final conn = await MySQLConnection.createConnection(
      host: "localhost", 
      port: 3306, 
      userName: "root", 
      password: "va34q4tk", 
      databaseName: "BancoSQL", 
    );
await conn.connect();

if(conn.connected){
  var result = await conn.execute('SELECT * FROM VEICULOS');

  for (var element in result.rows) {
  Map data = element.assoc();
  print(
      'ID: ${data['ID']}, Fabricante: ${data['FABRICANTE']}, Modelo: ${data['MODELO']}, Ano: ${data['ANO']}, Motor: ${data['MOTOR']}, Litragem: ${data['LITRAGEM']}, Cor: ${data['COR']}, Valor: ${data['VALOR']}');
}
conn.close();
  } else {
    print('Não foi possível se conectar ao banco de dados!');
  }


}

Future<void> atualizarVeiculos() async {

  final conn = await MySQLConnection.createConnection(
      host: "localhost", 
      port: 3306, 
      userName: "root",
      password: "va34q4tk", 
      databaseName: "BancoSQL", 
    );
  await conn.connect();

  var veiculos = await conn.execute('SELECT * FROM VEICULOS');
  for (final row in veiculos.rows) {
    print(row.assoc());
  }
  print("Digite o ID do carro que deseja atualizar:");
  int? idVeiculo = int.parse(stdin.readLineSync()!);

  print('Qual informação deseja alterar?');
  print('1-Fabricante\n2-Modelo\n3-Ano\n4-Motor\n5-Litragem\n6-Cor\n7-Valor\n8-Voltar');
  int? choiceAtualizar = int.parse(stdin.readLineSync()!);
  bool dadoAtualizado = false;

  if (choiceAtualizar < 1 || choiceAtualizar > 5) {
      print("********************Comando inválido, escolha um número entre 1 e 5!********************");
    } else {
      switch (choiceAtualizar) {
        case 1:
          print("Digite a nova fabricante:");
          String? fabricanteAtualizada = stdin.readLineSync();

          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET FABRICANTE = :fabricante WHERE ID = :id",
          {"fabricante": fabricanteAtualizada,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 2:
          print("Digite o novo modelo:");
          String? modeloAtualizado = stdin.readLineSync();
          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET MODELO = :modelo WHERE ID = :id",
          {"modelo": modeloAtualizado,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 3:
          print("Digite o novo ano:");
          String? anoAtualizado = stdin.readLineSync();
          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET ANO = :ano WHERE ID = :id",
          {"ano": anoAtualizado,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 4:
          print("Digite o novo motor:");
          String? motorAtualizado = stdin.readLineSync();
          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET MOTOR = :motor WHERE ID = :id",
          {"motor": motorAtualizado,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 5:
          print("Digite a nova litragem");
          String? litragemAtualizada = stdin.readLineSync();
          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET LITRAGEM = :litragem WHERE ID = :id",
          {"litragem": litragemAtualizada,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 6:
          print("Digite a nova cor");
          String? corAtualizada = stdin.readLineSync();
          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET COR = :cor WHERE ID = :id",
          {"cor": corAtualizada,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 7:
          print("Digite o novo valor");
          double? valorAtualizado = double.parse(stdin.readLineSync()!);
          var atualiza = await conn.execute(
          "UPDATE VEICULOS SET VALOR = :valor WHERE ID = :id",
          {"valor": valorAtualizado,
          "id": idVeiculo},
           );
           dadoAtualizado = true;
          break;
        case 8:
        dadoAtualizado = false;
          break;
    }
    }
  

  if (dadoAtualizado == true) {
    var veiculoAtualizado = await conn.execute(
    'SELECT * FROM VEICULOS WHERE ID = :id',
    {"id": idVeiculo});
    for (final row in veiculoAtualizado.rows) {
    print(row.assoc());
    }
  print('Veiculo atualizado com sucesso!');
  } else {atualizarVeiculos();}

}

Future<void> deletarVeiculos() async {
  final conn = await MySQLConnection.createConnection(
      host: "localhost", 
      port: 3306, 
      userName: "root",
      password: "va34q4tk", 
      databaseName: "BancoSQL", 
    );
  await conn.connect();

  var veiculos = await conn.execute('SELECT * FROM VEICULOS');
  for (final row in veiculos.rows) {
    print(row.assoc());
  }
  print("Digite o ID do carro que deseja deletar:");
  int? idVeiculo = int.parse(stdin.readLineSync()!);

  var veiculoDeletado = await conn.execute('DELETE FROM VEICULOS WHERE ID = :id', 
  {"id": idVeiculo});
   print("Veiculo deletado com sucesso!");
}

