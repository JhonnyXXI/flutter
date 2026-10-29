import 'package:flutter/material.dart';

import 'screens/clima_atual.dart';
import 'screens/previsao_semana.dart';
import 'screens/detalhes_avancados.dart';
import 'widgets/card_cidade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClimaApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // ABRIR DETALHES DA CIDADE
  void abrirDetalhes(BuildContext context, String cidade) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesAvancadosScreen(cidade: cidade),
      ),
    );
  }

  // ABRIR PREVISÃO SEMANAL
  void abrirPrevisao(BuildContext context, String cidade) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrevisaoSemanaScreen(cidade: cidade),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BARRA SUPERIOR
      appBar: AppBar(
        title: const Text(
          'ClimaApp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // TÍTULO DA CIDADE PRINCIPAL
          const Text(
            'Cidade de Cerulean, Kanto',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Confira as condições do tempo',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 16),

          // CARD PRINCIPAL - CERULEAN
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                abrirDetalhes(context, 'Cerulean');
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud, size: 65, color: Colors.blue),

                        SizedBox(width: 16),

                        Text(
                          '26°C',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Parcialmente chuvoso',
                      style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    ),

                    SizedBox(height: 20),

                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.water_drop, color: Colors.blue),
                            SizedBox(height: 4),
                            Text('Umidade'),
                            Text('65%'),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.air, color: Colors.blueGrey),
                            SizedBox(height: 4),
                            Text('Vento'),
                            Text('12 km/h'),
                          ],
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.umbrella, color: Colors.indigo),
                            SizedBox(height: 4),
                            Text('Chuva'),
                            Text('30%'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // BOTÃO DE PREVISÃO SEMANAL
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                abrirPrevisao(context, 'Cerulean');
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text('Ver previsão da semana'),
            ),
          ),

          const SizedBox(height: 24),

          // TÍTULO DAS OUTRAS CIDADES
          const Text(
            'Outras cidades',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 12),

          // PALLET TOWN
          CardCidade(
            nome: 'Pallet Town',
            temperatura: '27°C',
            minima: '20°C',
            maxima: '29°C',
            icone: Icons.wb_sunny,
            cor: Colors.orange,
            aoClicar: () {
              abrirDetalhes(context, 'Pallet Town');
            },
          ),

          const SizedBox(height: 8),

          // PEWTER CITY
          CardCidade(
            nome: 'Pewter City',
            temperatura: '22°C',
            minima: '17°C',
            maxima: '25°C',
            icone: Icons.cloud,
            cor: Colors.blueGrey,
            aoClicar: () {
              abrirDetalhes(context, 'Pewter City');
            },
          ),

          const SizedBox(height: 8),

          // VERMILION CITY
          CardCidade(
            nome: 'Vermilion City',
            temperatura: '29°C',
            minima: '21°C',
            maxima: '31°C',
            icone: Icons.air,
            cor: Colors.blue,
            aoClicar: () {
              abrirDetalhes(context, 'Vermilion City');
            },
          ),

          const SizedBox(height: 24),

          // CLIMA ATUAL
          Center(
            child: TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClimaAtualScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.thermostat),
              label: const Text('Ver clima atual'),
            ),
          ),

          // DETALHES DE CERULEAN
          Center(
            child: TextButton.icon(
              onPressed: () {
                abrirDetalhes(context, 'Cerulean');
              },
              icon: const Icon(Icons.info_outline),
              label: const Text('Detalhes de Cerulean'),
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
