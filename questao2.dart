/* 2. Faça um programa que cadastre 10 números, ordene-os e em seguida encontre e
mostre:
a) o menor número e quantas vezes ele aparece no vetor;
b) o maior número e quantas vezes ele aparece no vetor. */

import 'dart:io';

void main() {
  List<int> numeros = [];

  for (int i = 0; i < 10; i++) {
    print('Digite o ${i + 1}º número:');
    numeros.add(int.parse(stdin.readLineSync()!));
  }

  int menorNumero = numeros[0];
  for (int numero in numeros) {
    if (numero < menorNumero) {
      menorNumero = numero;
    }
  }

  int contMenor = numeros.where((numero) => numero == menorNumero).length;

  int maiorNumero = numeros[0];
  for (int numero in numeros) {
    if (numero > maiorNumero) {
      maiorNumero = numero;
    }
  }

  int contMaior = numeros.where((numero) => numero == maiorNumero).length;

  print('\nResultados:');
  print('Menor número: $menorNumero');
  print('Quantidade de aparições do menor número: $contMenor');
  print('Maior número: $maiorNumero');
  print('Quantidade de aparições do maior número: $contMaior');
}
