import 'package:flutter/material.dart';

import '../widgets/titulo_secao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  final String cidade;

  const PrevisaoSemanaScreen({super.key, this.cidade = 'Cerulean'});

  @override
  Widget build(BuildContext context) {
    String minima = '18°C';
    String media = '26°C';
    String maxima = '31°C';
    String manha = '20°C';
    String tarde = '29°C';

    List<String> temperaturas = [
      '19°C',
      '30°C',
      '18°C',
      '27°C',
      '17°C',
      '24°C',
      '20°C',
      '28°C',
      '21°C',
      '31°C',
    ];

    if (cidade == 'Pallet Town') {
      minima = '20°C';
      media = '27°C';
      maxima = '32°C';
      manha = '22°C';
      tarde = '30°C';

      temperaturas = [
        '20°C',
        '29°C',
        '21°C',
        '30°C',
        '22°C',
        '31°C',
        '20°C',
        '28°C',
        '23°C',
        '32°C',
      ];
    } else if (cidade == 'Pewter City') {
      minima = '15°C';
      media = '22°C';
      maxima = '26°C';
      manha = '17°C';
      tarde = '24°C';

      temperaturas = [
        '17°C',
        '25°C',
        '16°C',
        '23°C',
        '15°C',
        '22°C',
        '18°C',
        '26°C',
        '17°C',
        '24°C',
      ];
    } else if (cidade == 'Vermilion City') {
      minima = '21°C';
      media = '29°C';
      maxima = '34°C';
      manha = '24°C';
      tarde = '32°C';

      temperaturas = [
        '21°C',
        '31°C',
        '22°C',
        '32°C',
        '23°C',
        '33°C',
        '22°C',
        '30°C',
        '24°C',
        '34°C',
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão - $cidade'),
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
                  child: Center(child: Text(minima)),
                ),
              ),

              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.orange,
                  child: Center(child: Text(media)),
                ),
              ),

              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.redAccent,
                  child: Center(child: Text(maxima)),
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
                    child: Center(child: Text('Manhã: $manha')),
                  ),
                ),

                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orangeAccent,
                    child: Center(child: Text('Tarde: $tarde')),
                  ),
                ),
              ],
            ),
          ),

          const Divider(),

          // PRÓXIMOS DIAS
          const TituloSecao(titulo: 'Próximos dias'),

          LinhaPrevisao(
            dia: 'Sexta',
            icone: Icons.wb_sunny,
            minima: temperaturas[0],
            maxima: temperaturas[1],
            cor: Colors.orange,
          ),

          LinhaPrevisao(
            dia: 'Sábado',
            icone: Icons.cloud,
            minima: temperaturas[2],
            maxima: temperaturas[3],
            cor: Colors.blueGrey,
          ),

          LinhaPrevisao(
            dia: 'Domingo',
            icone: Icons.water_drop,
            minima: temperaturas[4],
            maxima: temperaturas[5],
            cor: Colors.blue,
          ),

          LinhaPrevisao(
            dia: 'Segunda',
            icone: Icons.cloud,
            minima: temperaturas[6],
            maxima: temperaturas[7],
            cor: Colors.blueGrey,
          ),

          LinhaPrevisao(
            dia: 'Terça',
            icone: Icons.wb_sunny,
            minima: temperaturas[8],
            maxima: temperaturas[9],
            cor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

// WIDGET REUTILIZÁVEL
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
