/* 5. Faça um programa que cadastre 15 números, não permitindo números repetidos.
Ordene-os em seguida, verifique se um número digitado pelo usuário está no vetor. Caso
encontre, verifique se está em uma posição par ou ímpar do vetor.
a) usando busca sequencial;
b) usando busca binária; */

import 'dart:io';

void main() {
  List<int> numeros = [];
  for (int i = 0; i < 15; i++) { // Corrigido o operador de incremento
    int numero;
    do {
      print("Digite o ${i + 1}º número:");
      numero = int.parse(stdin.readLineSync()!);
      if (numeros.contains(numero)) {
        print("Esse número já foi cadastrado, digite outro!");
      }
    } while (numeros.contains(numero));
    numeros.add(numero);
  }

  numeros.sort();
  print("\nNúmeros ordenados:");
  print(numeros);

  print("Digite um número a ser buscado na lista:");
  int numeroBusca = int.parse(stdin.readLineSync()!);
  int posicao = buscaSequencial(numeros, numeroBusca);
  if (posicao != -1) {
    print('O número $numeroBusca encontra-se na posição $posicao da lista.');
    print('A posição é ${posicao % 2 == 0 ? 'par' : 'ímpar'}.');
  } else {
    print('O número $numeroBusca não foi encontrado na lista.');
  }
}

int buscaSequencial(List<int> numeros, int numero) {
  for (int i = 0; i < numeros.length; i++) {
    if (numeros[i] == numero) {
      return i;
    }
  }
  return -1;
}

int buscaBinaria(List<int> numeros, int numero) {
  int inicio = 0;
  int fim = numeros.length - 1;
  while (inicio <= fim) {
    int meio = (inicio + fim) ~/ 2;
    if (numeros[meio] == numero) {
      return meio;
    } else if (numeros[meio] < numero) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }
  return -1; // Retorna -1 se o número não for encontrado
}
