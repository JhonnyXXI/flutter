import 'package:flutter/material.dart';

class CardCidade extends StatelessWidget {
  final String nome;
  final String temperatura;
  final String minima;
  final String maxima;
  final IconData icone;
  final Color cor;
  final VoidCallback aoClicar;

  const CardCidade({
    super.key,
    required this.nome,
    required this.temperatura,
    required this.minima,
    required this.maxima,
    required this.icone,
    required this.cor,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icone, color: cor),
        title: Text(nome),
        subtitle: Text('Mín: $minima | Máx: $maxima'),
        trailing: Text(temperatura),
        onTap: aoClicar,
      ),
    );
  }
}
