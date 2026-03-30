import 'package:flutter/material.dart';

class QuadradoWidget extends StatelessWidget {
  final double tamanho;
  final Color? cor;

  const QuadradoWidget({super.key, required this.tamanho, this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanho,
      height: tamanho,
      color: cor ?? Theme.of(context).colorScheme.primary,
    );
  }
}
