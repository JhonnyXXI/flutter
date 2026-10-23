import 'package:flutter/material.dart';

import '../widgets/titulo_secao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  const PrevisaoSemanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão da semana'),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // FAIXA DE TEMPERATURA
          const TituloSecao(titulo: 'Faixa de temperatura'),

          Row(
            children: [
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.lightBlue,
                  child: const Center(child: Text('18°C')),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.orange,
                  child: const Center(child: Text('26°C')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.redAccent,
                  child: const Center(child: Text('31°C')),
                ),
              ),
            ],
          ),

          const Divider(),

          // RESUMO DO DIA
          const TituloSecao(titulo: 'Resumo do dia'),

          Container(
            height: 200,
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.lightBlue,
                    child: const Center(child: Text('Manhã: 20°C')),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orangeAccent,
                    child: const Center(child: Text('Tarde: 29°C')),
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // PRÓXIMOS DIAS
          const TituloSecao(titulo: 'Próximos dias'),

          const LinhaPrevisao(
            dia: 'Sexta',
            icone: Icons.wb_sunny,
            minima: '19°C',
            maxima: '30°C',
            cor: Colors.orange,
          ),

          const LinhaPrevisao(
            dia: 'Sábado',
            icone: Icons.cloud,
            minima: '18°C',
            maxima: '27°C',
            cor: Colors.blueGrey,
          ),

          const LinhaPrevisao(
            dia: 'Domingo',
            icone: Icons.water_drop,
            minima: '17°C',
            maxima: '24°C',
            cor: Colors.blue,
          ),

          const LinhaPrevisao(
            dia: 'Segunda',
            icone: Icons.cloud,
            minima: '20°C',
            maxima: '28°C',
            cor: Colors.blueGrey,
          ),

          const LinhaPrevisao(
            dia: 'Terça',
            icone: Icons.wb_sunny,
            minima: '21°C',
            maxima: '31°C',
            cor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

// WIDGET DOS PRÓXIMOS DIAS
class LinhaPrevisao extends StatelessWidget {
  final String dia;
  final IconData icone;
  final String minima;
  final String maxima;
  final Color cor;

  const LinhaPrevisao({
    super.key,
    required this.dia,
    required this.icone,
    required this.minima,
    required this.maxima,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Expanded(flex: 2, child: Text(dia)),

              Icon(icone, size: 28, color: cor),

              Expanded(child: Center(child: Text(minima))),

              Expanded(child: Center(child: Text(maxima))),
            ],
          ),
        ),

        const Divider(),
      ],
    );
  }
}
