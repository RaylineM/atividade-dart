import 'dart:io';

class Produto {
  final int codigo;
  final String descricao;
  final double preco;

  const Produto(this.codigo, this.descricao, this.preco);

  @override
  String toString() => 'Código: $codigo\nDescrição: $descricao\nPreço: R\$ $preco\n';
}

void main() {
  final produtos = List.generate(12, (_) {
    stdout.write('Digite o código do produto: ');
    final codigo = int.parse(stdin.readLineSync()!);

    stdout.write('Digite a descrição do produto: ');
    final descricao = stdin.readLineSync()!;

    stdout.write('Digite o preço do produto: ');
    final preco = double.parse(stdin.readLineSync()!);

    return Produto(codigo, descricao, preco);
  });

  produtos.sort((a, b) => a.codigo.compareTo(b.codigo));

  stdout.write('Digite o código do produto que deseja encontrar: ');
  final codigo = int.parse(stdin.readLineSync()!);

  final posicaoSequencial = buscaSequencial(produtos, codigo);
  final comparacoesSequencial = posicaoSequencial == -1 ? produtos.length : posicaoSequencial + 1;

  final posicaoBinaria = buscaBinaria(produtos, codigo);
  final comparacoesBinaria = posicaoBinaria == -1 ? (produtos.length / 2).ceil() : posicaoBinaria + 1;

  if (posicaoSequencial == -1) {
    print('Produto não encontrado.');
  } else {
    print('Produto encontrado na posição $posicaoSequencial.');
    print('Número de comparações (busca sequencial): $comparacoesSequencial');
  }

  if (posicaoBinaria == -1) {
    print('Produto não encontrado.');
  } else {
    print('Produto encontrado na posição $posicaoBinaria.');
    print('Número de comparações (busca binária): $comparacoesBinaria');
  }
}

int buscaSequencial(List<Produto> produtos, int codigo) {
  for (var i = 0; i < produtos.length; i++) {
    if (produtos[i].codigo == codigo) return i;
  }
  return -1;
}

int buscaBinaria(List<Produto> produtos, int codigo) {
  var inicio = 0;
  var fim = produtos.length - 1;

  while (inicio <= fim) {
    final meio = (inicio + fim) ~/ 2;
    if (produtos[meio].codigo == codigo) return meio;
    if (produtos[meio].codigo < codigo) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }
  return -1;
}
