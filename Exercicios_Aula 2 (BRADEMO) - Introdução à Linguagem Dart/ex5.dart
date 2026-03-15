import 'dart:io';

class House{
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);

  imprimir(){
    print("\nCasa: ");
    print("id: $id");
    print("nome: $name");
    print("preço: $price");
  }
}

void main(){

  List<House> listaCasasCadastradas = [];
  

  for (int i=0; i< 3; i++){
    print("\nDigite o id da casa: ");
    int id = int.parse(stdin.readLineSync()!);


    print("\nDigite o nome da casa: ");
    String name = stdin.readLineSync()!;

    print("\nDigite o preço da casa: ");
    double price = double.parse(stdin.readLineSync()!);

    House novacasa = House(id, name, price);

    listaCasasCadastradas.add(novacasa);
  }
    
  for (var casa in listaCasasCadastradas) {
    casa
      ..name = "${casa.name} (Cadastrada)";
  }

  for (var casa in listaCasasCadastradas) {
    casa.imprimir();
  }


  }
