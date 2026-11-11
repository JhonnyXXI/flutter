import 'package:flutter/material.dart';

import '../models/cidade.dart';
import '../widgets/titulo_secao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  final Cidade cidade;

  const PrevisaoSemanaScreen({super.key, required this.cidade});

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão - ${cidade.nome}'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TituloSecao(titulo: 'Previsão do tempo - ${cidade.nome}'),

          const SizedBox(height: 8),

          Text(
            'Temperatura atual: ${cidade.temperatura}°C',
            style: const TextStyle(fontSize: 16),
          ),

          const Divider(height: 32),

          // FAIXA DE TEMPERATURA
          const TituloSecao(titulo: 'Faixa de temperatura'),

          if (cidade.previsao.isNotEmpty)
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text('${cidade.previsao.first.minima}°C'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    height: 60,
                    color: Colors.orange,
                    child: Center(child: Text('${cidade.temperatura}°C')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text('${cidade.previsao.first.maxima}°C'),
                    ),
                  ),
                ),
              ],
            ),

          const Divider(height: 32),

          // PRÓXIMOS DIAS
          const TituloSecao(titulo: 'Próximos dias'),

          ...cidade.previsao.map((dia) {
            return Card(
              child: ListTile(
                leading: Icon(
                  escolherIcone(dia.condicao),
                  color: Colors.blue,
                  size: 30,
                ),
                title: Text(dia.dia),
                subtitle: Text(dia.condicao),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Máx: ${dia.maxima}°C'),
                    Text('Mín: ${dia.minima}°C'),
                  ],
                ),
              ),
            );
          }),

          const Divider(height: 32),

          // RESUMO CLIMÁTICO
          const TituloSecao(titulo: 'Resumo climático'),

          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.water_drop, color: Colors.blue),
                  title: const Text('Umidade'),
                  trailing: Text('${cidade.umidade}%'),
                ),
                ListTile(
                  leading: const Icon(Icons.air),
                  title: const Text('Vento'),
                  trailing: Text('${cidade.vento} km/h'),
                ),
                ListTile(
                  leading: const Icon(Icons.umbrella),
                  title: const Text('Chuva'),
                  trailing: Text('${cidade.chuva}%'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
