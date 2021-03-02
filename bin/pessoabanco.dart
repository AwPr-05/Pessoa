import 'dart:io';

import 'package:dart_console/dart_console.dart';

Pessoa pedro;
String perguntaMall;
int itemCompra;
String outroProduto;
Map<String, double> itens = {
  "Teclado": 1500.0,
  "Rolex": 70000.0,
  "Vestido": 300.0,
  "Ipad": 7000.0
};

var console = Console();

enum Sexo { MASCULINO, FEMININO, OUTROS }
enum CorCabelo { PRETO, LOIRO, RUIVO }
enum CorPele { NEGRO, BRANCO, PARDO }

class Banco {
  double _saldo;

  Banco({double saldo}) {
    _saldo = saldo;
  }

  set saldo(double valor) {
    _saldo = valor;
  }

  double get saldo => _saldo;

  // metodos
  bool saque(double valor) {
    if (valor > _saldo) {
      return false;
    } else {
      _saldo -= valor;
      return true;
    }
  }

  bool deposito(double valor) {
    _saldo += valor;
    return true;
  }
}

class Pessoa {
  String _nome;
  int _idade;
  String _cpf;
  double _peso;
  double _altura;
  String _comidaFavorita;

  Sexo _sexo;
  CorCabelo _corCabelo;
  CorPele _corPele;
  Banco _contaBancaria;

  Pessoa(
      {String nome,
      int idade,
      String cpf,
      double peso,
      double altura,
      String comidaFavorita,
      Sexo sexo,
      CorCabelo corCabelo,
      CorPele corPele,
      Banco contaBancaria}) {
    _nome = nome;
    _idade = idade;
    _cpf = cpf;
    _peso = peso;
    _altura = altura;
    _comidaFavorita = comidaFavorita;
    _sexo = sexo;
    _corCabelo = corCabelo;
    _corPele = corPele;
    _contaBancaria = contaBancaria;
  }

  set nome(String valor) {
    _nome = valor;
  }

  String get nome => _nome;

  set idade(int valor) {
    _idade = valor;
  }

  int get idade => _idade;

  set cpf(String valor) {
    _cpf = valor;
  }

  String get cpf => _cpf;

  set peso(double valor) {
    _peso = valor;
  }

  double get peso => _peso;

  set altura(double valor) {
    _altura = valor;
  }

  double get altura => _altura;

  set sexo(Sexo valor) {
    _sexo = valor;
  }

  Sexo get sexo => _sexo;

  set comidaFavorita(String valor) {
    _comidaFavorita = valor;
  }

  String get comidaFavorita => _comidaFavorita;

  set corCabelo(CorCabelo valor) {
    _corCabelo = valor;
  }

  CorCabelo get corCabelo => _corCabelo;

  set corPele(CorPele valor) {
    _corPele = valor;
  }

  CorPele get corPele => _corPele;

  set contaBancaria(Banco valor) {
    _contaBancaria = valor;
  }

  Banco get contaBancaria => _contaBancaria;

// metodos

  void andar() => print("Uhuuuu estou andando!!");

  void irAPadaria() => print("Vamos comprar $_comidaFavorita, Umm Delicia!!!");

  void irAoShopping() {
    print("Uhuu vou fritar o meu salario!!");
  }

  bool comprar({String nomeProduto, double precoProduto}) {
    if (contaBancaria.saque(precoProduto)) {
      print("Parabens pelo $nomeProduto novo, Otima aquisicao!!");
      return true;
    } else {
      print("Calote Aqui nao heim!");
      return false;
    }
  }

  String toString() =>
      " ||Nome: $_nome \n ||Idade: $_idade \n ||Cpf: $_cpf \n ||Altura: $_altura \n ||Peso: $_peso \n ||Sexo: $_sexo \n ||Saldo: ${_contaBancaria.saldo} \n ||CorCabelo $_corCabelo \n ||CorPele $_corPele \n ||ComidaFavorita$_comidaFavorita";
}
// criar banco e colocar dados de uma conta corrente, depois colocar na classe Pessoa e fazer os devidos metodos

main() {
  pedro = Pessoa(
    nome: "Pedro",
    idade: 15,
    cpf: "123.456.789-12",
    peso: 61.6,
    altura: 169,
    comidaFavorita: "Fraldinha",
    sexo: Sexo.MASCULINO,
    corCabelo: CorCabelo.PRETO,
    corPele: CorPele.PARDO,
    contaBancaria: Banco(saldo: 10000.0),
  );

  while (perguntaMall == null) {
    print("Gostaria de ir ao shopping? (s/n) ");
    perguntaMall = stdin.readLineSync().toLowerCase();
    console.clearScreen();
    if (perguntaMall != "n" && perguntaMall != "s") {
      perguntaMall == null;
    } else if (perguntaMall == "n") {
      print("Ok Hoje nao e dia de fazer compras!!");
    } else {
      print("Boas Compras!!");
      while (itemCompra == null) {
        print("Seu saldo e: ${pedro.contaBancaria.saldo}");
        print("O que deseja comprar?");
        printListaProdutos();
        itemCompra = int.tryParse(stdin.readLineSync());
        console.clearScreen();
        if (itemCompra == null || itemCompra > 4 || itemCompra < 1) {
          print("O seu ANIMAL digita um valor valido!!!");
          itemCompra = null;
        } else {
          if (!tentativaCompra(itemCompra)) {
            // console.clearScreen();
            print("Voce nao tem dinheiro suficiente!!");
            itens.remove(itens.keys.elementAt(itemCompra - 1));
            itemCompra = null;
          } else {
            outroProduto = null;
            while (outroProduto == null) {
              print("Gostaria de comprar outra coisa? (s/n) ");
              outroProduto = stdin.readLineSync().toLowerCase();
              console.clearScreen();
              if (outroProduto != "n" && outroProduto != "s") {
                print("Larga a mao de ser burro e coloca um valor certo!!");
                outroProduto = null;
              } else if (outroProduto == "n") {
                print("Ok, Muito obrigado pela visita e ate a proxima!!");
              } else {
                print("Ok, Boas compras!!");
                itemCompra = null;
              }
            }
          }
          // print(pedro);
        }
      }
    }
  }
}

bool tentativaCompra(int valor) {
  return pedro.comprar(
      nomeProduto: itens.keys.elementAt(valor - 1),
      precoProduto: itens[itens.keys.elementAt(valor - 1)]);
}

void printListaProdutos() {
  String printar = "";
  for (int i = 0; i < itens.length; i++) {
    printar +=
        "(${i + 1}) ${itens.keys.elementAt(i)} - ${itens[itens.keys.elementAt(i)]}\n";
  }
  print(printar);
}

// se nao tiver saldo, dar a opcao de compra de outro prduto, mas bloquear o que ele ja tentou comprar mas nao conseguiu
// dar a opcao de comprar mais coisas e printar saldo
//  Feito

// criar metodo ir ao cabeleleiro ja que temos a cor do cabelo da pessoa
