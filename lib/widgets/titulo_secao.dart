
import 'package:flutter/material.dart';

class TituloSecao extends StatelessWidget {
  final String titulo;

  const TituloSecao({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}
