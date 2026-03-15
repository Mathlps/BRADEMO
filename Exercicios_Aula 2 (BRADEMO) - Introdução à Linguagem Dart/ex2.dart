void cadastrar({required String nome, String? cargo}) {
  print("\nBoas Vindas $nome! $cargo");
}

void main() {
  cadastrar(nome: "João");
  cadastrar(nome: "Matheus", cargo: "Jovem Aprendiz");
}