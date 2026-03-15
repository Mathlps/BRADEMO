class Laptop{
    var id;
    var nome;
    int ram;
    double clockCpu;

    Laptop(
      this.id,
      this.nome,
      this.ram,
      this.clockCpu
    );

     void imprimir() {
    print("\nLaptop:");
    print("id: $id");
    print("nome: $nome");
    print("ram: $ram Gb");
    print("clockCpu: $clockCpu Ghz");
  }
  }



void main(){
  var eq1 = Laptop(1, "Samsungbook", 8, 1.30);
  eq1.imprimir();
  var eq2 = Laptop(2, "Samsungbook2", 12, 2.30);
  eq2.imprimir();
  var eq3 = Laptop(3, "Samsungbook3", 16, 3.30);
  eq3.imprimir();

  
}