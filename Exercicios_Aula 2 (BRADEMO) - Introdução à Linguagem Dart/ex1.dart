void main() {
  var nomeEquipamento = "Impressora 3d";
  String local = "IFSP";
  dynamic patrimonio = 12345;

  patrimonio = "12345-A";

  //imprimindo
  print("\nEquipamento: "+ nomeEquipamento + "\nLocal: " + local + "\nPatrimonio: " + patrimonio);

  print("\n\n");

  //mostrando os valores

  print(nomeEquipamento is String);
  print(local is String);
  print(patrimonio is int);
  
}
