import 'dart:io';

void main() {
  List<String> nomes = [];
  List<List<double>> notas = [];
  String? acao;

  while (acao != '3') {
    cabecalho();
    print('Escolha uma ação:');
    print("1 - Registrar");
    print("2 - Listar");
    print("3 - Sair");
    acao = stdin.readLineSync();

    switch (acao) {
      case '1':
        registrarAluno(nomes, notas);
        break;
      case '2':
        listarAlunos(nomes, notas);
        break;
      case '3':
        print('Saindo...');
        break;
      default:
        print('Ação inválida.');
    }
  }
}

void registrarAluno(List<String> nomes, List<List<double>> notas) {
  print('Digite o nome do aluno:');
  String? nome = stdin.readLineSync();

  if (nome != null) {
    nomes.add(nome);
    List<double> notasAluno = [];

    while (true) {
      print('Digite uma nota para o aluno (ou "fim" para terminar):');
      String? entrada = stdin.readLineSync();

      if (entrada == 'fim') {
        break;
      } else if (entrada != null) {
        double nota = double.parse(entrada);
        notasAluno.add(nota);
      }
    }

    notas.add(notasAluno);
  } else {
    print('Nome inválido.');
  }
}

void listarAlunos(List<String> nomes, List<List<double>> notas) {
  print('Lista de alunos e suas médias:');
  for (int i = 0; i < nomes.length; i++) {
    double media = calcularMedia(notas[i]);
    print('${nomes[i]}: ${media.toStringAsFixed(2)}');
  }
}

double calcularMedia(List<double> notas) {
  double soma = 0;
  for (double nota in notas) {
    soma += nota;
  }
  return soma / notas.length;
}

void cabecalho() {
  print("  _____ ____ _____ ______    ___  ___ ___   ____      ___      ___                                   ");
  print(" / ___/|    / ___/|      |  /  _]|   |   | /    |    |   \\    /  _]                                  ");
  print("(   \\_  |  (   \\_ |      | /  [_ | _   _ ||  o  |    |    \\  /  [_                                   ");
  print(" \\__  | |  |\\__  ||_|  |_||    _]|  \\_/  ||     |    |  D  ||    _]                                  ");
  print(" /  \\ | |  |/  \\ |  |  |  |   [_ |   |   ||  _  |    |     ||   [_                                   ");
  print(" \\    | |  |\\    |  |  |  |     ||   |   ||  |  |    |     ||     |                                  ");
  print("  \\___||____|\\___|  |__|  |_____||___|___||__|__|    |_____||_____|                                  ");
  print("                                                                                                     ");
  print("  ____    __   ___   ___ ___  ____   ____  ____   __ __   ____  ___ ___    ___  ____   ______   ___  ");
  print(" /    |  /  ] /   \\ |   |   ||    \\ /    ||    \\ |  |  | /    ||   |   |  /  _]|    \\ |      | /   \\ ");
  print("|  o  | /  / |     || _   _ ||  o  )  o  ||  _  ||  |  ||  o  || _   _ | /  [_ |  _  ||      ||     |");
  print("|     |/  /  |  O  ||  \\_/  ||   _/|     ||  |  ||  _  ||     ||  \\_/  ||    _]|  |  ||_|  |_||  O  |");
  print("|  _  /   \\_ |     ||   |   ||  |  |  _  ||  |  ||  |  ||  _  ||   |   ||   [_ |  |  |  |  |  |     |");
  print("|  |  \\     ||     ||   |   ||  |  |  |  ||  |  ||  |  ||  |  ||   |   ||     ||  |  |  |  |  |     |");
  print("|__|__|\\____| \\___/ |___|___||__|  |__|__||__|__||__|__||__|__||___|___||_____||__|__|  |__|   \\___/ ");
  print("                                                                                                     ");
  print("   ___  _____   __   ___   _       ____  ____                                                        ");
  print("  /  _]/ ___/  /  ] /   \\ | |     /    ||    \\                                                       ");
  print(" /  [_(   \\_  /  / |     || |    |  o  ||  D  )                                                      ");
  print("|    _]\\__  |/  /  |  O  || |___ |     ||    /                                                       ");
  print("|   [_ /  \\ /   \\_ |     ||     ||  _  ||    \\                                                      ");
  print("|     |\\    \\     ||     ||     ||  |  ||  .  \\                                                      ");
  print("|_____| \\___|\\____| \\___/ |_____||__|__||__|\\_|                                                      ");
  print("                                                                                                     ");
}