import 'package:flutter/material.dart';

import '../models/cidade.dart';
import '../widgets/titulo_secao.dart';
import 'previsao_semana.dart';

class VerClimaScreen extends StatelessWidget {
  final Cidade cidade;

  const VerClimaScreen({super.key, required this.cidade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima - ${cidade.nome}'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TituloSecao(titulo: cidade.nome),

          const SizedBox(height: 12),

          // IMAGEM DA CIDADE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      cidade.imagem,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.blueGrey,
                          child: const Center(
                            child: Icon(
                              Icons.cloud,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 16,
                    bottom: 16,
                    child: Text(
                      '${cidade.temperatura}°C',
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
                    child: Icon(Icons.cloud, size: 32, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          Center(
            child: Text(
              cidade.condicao,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(height: 32),

          // INFORMAÇÕES CLIMÁTICAS
          const TituloSecao(titulo: 'Condições climáticas'),

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
                  title: const Text('Probabilidade de chuva'),
                  trailing: Text('${cidade.chuva}%'),
                ),
              ],
            ),
          ),

          const Divider(height: 32),

          // ALERTAS
          const TituloSecao(titulo: 'Alertas'),

          Card(
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.orange),
              title: Text(cidade.alerta),
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
                    Text(
                      '${cidade.indiceUv}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Text('Índice UV'),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.speed, color: Colors.blue),
                    Text(
                      '${cidade.pressao} hPa',
                      style: const TextStyle(fontSize: 22),
                    ),
                    const Text('Pressão'),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.visibility, color: Colors.green),
                    Text(
                      '${cidade.visibilidade} km',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Text('Visibilidade'),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wb_twilight, color: Colors.orange),
                    Text(
                      cidade.nascerSol,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Text('Nascer do sol'),
                  ],
                ),
              ),
            ],
          ),

          const Divider(height: 32),

          // PRÓXIMOS 3 DIAS
          const TituloSecao(titulo: 'Próximos 3 dias'),

          Card(
            child: Column(
              children: cidade.previsao.take(3).map((dia) {
                return ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.blue),
                  title: Text(dia.dia),
                  subtitle: Text(dia.condicao),
                  trailing: Text(
                    '${dia.minima}° / ${dia.maxima}°',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          // PREVISÃO COMPLETA
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
