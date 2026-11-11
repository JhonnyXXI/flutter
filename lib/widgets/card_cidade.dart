import 'package:flutter/material.dart';

import '../models/cidade.dart';

class CardCidade extends StatelessWidget {
  final Cidade cidade;
  final VoidCallback aoClicar;

  const CardCidade({super.key, required this.cidade, required this.aoClicar});

  IconData escolherIcone(String condicao) {
    final texto = condicao.toLowerCase();

    if (texto.contains('chuv')) {
      return Icons.water_drop;
    }

    if (texto.contains('nublado')) {
      return Icons.cloud;
    }

    if (texto.contains('vento')) {
      return Icons.air;
    }

    return Icons.wb_sunny;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          escolherIcone(cidade.condicao),
          color: Colors.blue,
          size: 30,
        ),
        title: Text(cidade.nome),
        subtitle: Text(cidade.condicao),
        trailing: Text(
          '${cidade.temperatura}°C',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onTap: aoClicar,
      ),
    );
  }
}
