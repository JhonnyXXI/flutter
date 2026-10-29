import 'package:flutter/material.dart';

import '../widgets/titulo_secao.dart';
import 'previsao_semana.dart';

class DetalhesAvancadosScreen extends StatelessWidget {
  final String cidade;

  const DetalhesAvancadosScreen({super.key, this.cidade = 'Cerulean'});

  @override
  Widget build(BuildContext context) {
    // DADOS PADRÃO - CERULEAN
    String temperatura = '26°C';
    String imagem = 'https://picsum.photos/id/870/800/400';
    String alerta = 'Chuva forte';
    String descricao = 'Possibilidade de chuva à tarde';
    String condicao = 'Parcialmente chuvoso';
    String uv = '6';
    String pressao = '1013 hPa';
    String visibilidade = '10 km';
    String nascerSol = '06:15';

    List<String> minimas = ['19°C', '18°C', '17°C'];
    List<String> maximas = ['30°C', '27°C', '24°C'];

    // PALLET TOWN
    if (cidade == 'Pallet Town') {
      temperatura = '27°C';
      imagem = 'https://picsum.photos/id/167/800/400';
      alerta = 'Sol forte';
      descricao = 'Temperatura elevada durante a tarde';
      condicao = 'Ensolarado';
      uv = '8';
      pressao = '1015 hPa';
      visibilidade = '12 km';
      nascerSol = '06:10';

      minimas = ['20°C', '21°C', '22°C'];
      maximas = ['29°C', '30°C', '31°C'];
    }
    // PEWTER CITY
    else if (cidade == 'Pewter City') {
      temperatura = '22°C';
      imagem = 'https://picsum.photos/id/1018/800/400';
      alerta = 'Tempo nublado';
      descricao = 'Possibilidade de chuva fraca';
      condicao = 'Nublado';
      uv = '3';
      pressao = '1018 hPa';
      visibilidade = '8 km';
      nascerSol = '06:20';

      minimas = ['17°C', '16°C', '15°C'];
      maximas = ['25°C', '23°C', '22°C'];
    }
    // VERMILION CITY
    else if (cidade == 'Vermilion City') {
      temperatura = '29°C';
      imagem = 'https://picsum.photos/id/1015/800/400';
      alerta = 'Ventos fortes';
      descricao = 'Rajadas de vento durante a tarde';
      condicao = 'Ensolarado com vento';
      uv = '7';
      pressao = '1010 hPa';
      visibilidade = '15 km';
      nascerSol = '06:05';

      minimas = ['21°C', '22°C', '23°C'];
      maximas = ['31°C', '32°C', '33°C'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes - $cidade'),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // NOME DA CIDADE
          TituloSecao(titulo: cidade),

          const SizedBox(height: 12),

          // IMAGEM E TEMPERATURA
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    imagem,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.blueGrey);
                    },
                  ),
                ),

                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    temperatura,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                    ),
                  ),
                ),

                const Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(Icons.cloud, color: Colors.white, size: 32),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Text(
              condicao,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(height: 32),

          // ALERTAS
          const TituloSecao(titulo: 'Alertas'),

          Card(
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.orange),
              title: Text(alerta),
              subtitle: Text(descricao),
            ),
          ),

          const Divider(height: 32),

          // INDICADORES
          const TituloSecao(titulo: 'Indicadores'),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            children: [
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wb_sunny, color: Colors.orange),
                    Text(uv, style: const TextStyle(fontSize: 24)),
                    const Text('Índice UV'),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.speed, color: Colors.blue),
                    Text(pressao, style: const TextStyle(fontSize: 24)),
                    const Text('Pressão'),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.visibility, color: Colors.green),
                    Text(visibilidade, style: const TextStyle(fontSize: 24)),
                    const Text('Visibilidade'),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wb_twilight, color: Colors.orange),
                    Text(nascerSol, style: const TextStyle(fontSize: 24)),
                    const Text('Nascer do sol'),
                  ],
                ),
              ),
            ],
          ),

          const Divider(height: 32),

          // PREVISÃO DOS PRÓXIMOS DIAS
          const TituloSecao(titulo: 'Próximos 3 dias'),

          const SizedBox(height: 8),

          Card(
            child: Column(
              children: [
                LinhaPrevisaoDetalhes(
                  dia: 'Sexta',
                  icone: Icons.wb_sunny,
                  minima: minimas[0],
                  maxima: maximas[0],
                ),

                const Divider(height: 1),

                LinhaPrevisaoDetalhes(
                  dia: 'Sábado',
                  icone: Icons.cloud,
                  minima: minimas[1],
                  maxima: maximas[1],
                ),

                const Divider(height: 1),

                LinhaPrevisaoDetalhes(
                  dia: 'Domingo',
                  icone: Icons.water_drop,
                  minima: minimas[2],
                  maxima: maximas[2],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // BOTÃO PARA PREVISÃO COMPLETA
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrevisaoSemanaScreen(cidade: cidade),
                ),
              );
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text('Ver previsão completa'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// WIDGET REUTILIZÁVEL DA PREVISÃO
class LinhaPrevisaoDetalhes extends StatelessWidget {
  final String dia;
  final IconData icone;
  final String minima;
  final String maxima;

  const LinhaPrevisaoDetalhes({
    super.key,
    required this.dia,
    required this.icone,
    required this.minima,
    required this.maxima,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icone, color: Colors.blue),
      title: Text(dia),
      subtitle: Text('Mín: $minima'),
      trailing: Text(
        'Máx: $maxima',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
