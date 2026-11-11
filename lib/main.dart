import 'package:flutter/material.dart';

import 'models/cidade.dart';
import 'screens/ver_clima.dart';
import 'screens/previsao_semana.dart';
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

  // ABRIR CLIMA DA CIDADE
  void abrirClima(BuildContext context, Cidade cidade) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VerClimaScreen(cidade: cidade)),
    );
  }

  // ABRIR PREVISÃO DA CIDADE
  void abrirPrevisao(BuildContext context, Cidade cidade) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PrevisaoSemanaScreen(cidade: cidade),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Cidade cidadePrincipal = cidades.first;

    return Scaffold(
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
          // CIDADE PRINCIPAL
          Text(
            'Cidade de ${cidadePrincipal.nome}, Kanto',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          const Text(
            'Confira as condições do tempo',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 16),

          // CARD PRINCIPAL
          Card(
            elevation: 3,
            child: InkWell(
              onTap: () {
                abrirClima(context, cidadePrincipal);
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(Icons.cloud, size: 65, color: Colors.blue),

                    const SizedBox(height: 12),

                    Text(
                      '${cidadePrincipal.temperatura}°C',
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      cidadePrincipal.condicao,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 20),

                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        Text('Umidade: ${cidadePrincipal.umidade}%'),
                        Text('Vento: ${cidadePrincipal.vento} km/h'),
                        Text('Chuva: ${cidadePrincipal.chuva}%'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // PREVISÃO SEMANAL
          ElevatedButton.icon(
            onPressed: () {
              abrirPrevisao(context, cidadePrincipal);
            },
            icon: const Icon(Icons.calendar_month),
            label: const Text('Ver previsão da semana'),
          ),

          const SizedBox(height: 24),

          // OUTRAS CIDADES
          const Text(
            'Outras cidades',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 12),

          // CARDS REUTILIZÁVEIS
          ...cidades.skip(1).map((cidade) {
            return CardCidade(
              cidade: cidade,
              aoClicar: () {
                abrirClima(context, cidade);
              },
            );
          }),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
