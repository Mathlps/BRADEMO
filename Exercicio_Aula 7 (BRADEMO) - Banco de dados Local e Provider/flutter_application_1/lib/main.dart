import 'package:flutter/material.dart';
import 'package:flutter_application_1/ex2.dart';
import 'package:flutter_application_1/ex3.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ex1.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('configuracoes');

  await Hive.initFlutter();

  await Hive.openBox('tarefasBox');

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ex3(),
    ),
  );
}