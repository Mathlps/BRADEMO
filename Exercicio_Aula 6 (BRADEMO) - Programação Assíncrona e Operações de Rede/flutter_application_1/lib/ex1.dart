Future<String> fetchRole() async {
  return 'Administrador';
}

Future<String> fetchNewUsername() async {
  return 'matheus123';
}

Future<String> fetchUsername() async {
  return 'Matheus';
}

// Exercício 1
Future<String> reportUserRole() async {
  String role = await fetchRole();
  return 'User role: $role';
}

// Exercício 2
Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (err) {
    return err.toString();
  }
}

// Exercício 3
String addHello(String user) {
  return 'Hello $user';
}

Future<String> greetUser() async {
  String username = await fetchUsername();
  return addHello(username);
}


Future<void> main() async {
 //Atividade 1
  print(await reportUserRole());

  print(await changeUsername());

  print(await greetUser());

}

