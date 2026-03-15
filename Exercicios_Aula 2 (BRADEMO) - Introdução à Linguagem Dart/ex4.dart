class Laptop {
  var id;
  var nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  // internet
  Laptop.internet(this.id) 
  : nome = "Laptop Básico", 
  ram = 4, 
  clockCpu = 1.6;

  // escritório
  Laptop.escritorio(this.id)
    : nome = "Laptop Escritório",
      ram = 8,
      clockCpu = 2.2;

  // programação
  Laptop.programacao(this.id)
    : nome = "Laptop Programador",
      ram = 16,
      clockCpu = 3.0;

  void imprimir() {
    print("\nLaptop:");
    print("id: $id");
    print("nome: $nome");
    print("ram: $ram GB");
    print("clockCpu: $clockCpu GHz");
  }
}

void main() {
  var laptopInternet = Laptop.internet(1);
  var laptopEscritorio = Laptop.escritorio(2);
  var laptopProgramacao = Laptop.programacao(3);

  laptopInternet.imprimir();
  laptopEscritorio.imprimir();
  laptopProgramacao.imprimir();
}
