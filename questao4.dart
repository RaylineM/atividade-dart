/* 4. Faça um programa que cadastre 8 alunos. Para cada aluno devem ser cadastrados:
nome, nota 1 e nota 2. Primeiro, liste todos os alunos cadastrados ordenando-os pela média
ponderada das notas, tendo a primeira nota peso 2 e a segunda peso 3. Em seguida,
ordene os alunos, de forma crescente, pela nota 1, e liste-os. Finalmente, considerando que
para ser aprovado o aluno deve ter no mínimo média 7, liste, em ordem alfabética, os
alunos reprovados. */

import 'dart:io';

void main() {
  List<Aluno> alunos = [];

  for (int i = 0; i < 8; i++) {
    print('Cadastre o ${i + 1}º aluno:');
    print('Nome: ');
    String nome = stdin.readLineSync()!;
    print('Primeira nota: ');
    double nota1 = double.parse(stdin.readLineSync()!);
    print('Segunda nota: ');
    double nota2 = double.parse(stdin.readLineSync()!);

    alunos.add(Aluno(nome, nota1, nota2));
  }

  alunos.sort((a, b) => b.mediaPonderada().compareTo(a.mediaPonderada()));
  print('\nLista de alunos ordenados pela média ponderada das notas:');
  for (var aluno in alunos) {
    print('${aluno.nome} - Média: ${aluno.mediaPonderada().toStringAsFixed(2)}');
  }

  alunos.sort((a, b) => a.nota1.compareTo(b.nota1));
  print('\nLista de alunos ordenados pela nota 1:');
  for (var aluno in alunos) {
    print('${aluno.nome} - Nota 1: ${aluno.nota1}');
  }

  Iterable<Aluno> reprovados = alunos.where((aluno) => aluno.mediaPonderada() < 7);
  List<Aluno> listaReprovados = reprovados.toList();
  listaReprovados.sort((a, b) => a.nome.compareTo(b.nome));
  print('\nLista de alunos reprovados:');
  for (var aluno in listaReprovados) {
    print('${aluno.nome} - Média: ${aluno.mediaPonderada().toStringAsFixed(2)}');
  }
}

class Aluno {
  String nome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.nota1, this.nota2);

  double mediaPonderada() {
    return (nota1 * nota2 * 3) / 5;
  }
}
