Future<String> fetchUsernameWithError() async {
  throw Exception('Erro ao buscar usuário');
}

Future<String> handleUsernameError() async {
  try {
    return await fetchUsernameWithError();
  } catch (err) {
    return err.toString();
  }
}

Future<void> main() async {
  print(await handleUsernameError());
}