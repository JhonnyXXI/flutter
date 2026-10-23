
import 'package:flutter/material.dart';
import '../widgets/titulo_secao.dart';

class ClimaAtualScreen extends StatelessWidget {
  const ClimaAtualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima atual'),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // CIDADE
          const TituloSecao(titulo: 'Cidade atual'),

          Container(
            color: Colors.lightBlue.shade100,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Cidade de Cerulean, Kanto',
                    style: TextStyle(fontSize: 22),
                  ),
                  Text('22 de outubro de 2026'),
                ],
              ),
            ),
          ),

          const Divider(),

          // TEMPERATURA
          const TituloSecao(titulo: 'Temperatura'),

          const Center(
            child: Text(
              '26°C',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          const Center(
            child: Text('Sensação térmica: 28°C'),
          ),

          const Divider(),

          // CONDIÇÃO DO TEMPO
          const TituloSecao(titulo: 'Condição do tempo'),

          Center(
            child: Image.network(
              'https://picsum.photos/id/870/200/300?grayscale&blur=2',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.broken_image,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
          ),

          const Center(
            child: Text('Parcialmente chuvoso'),
          ),

          const Divider(),

          // DETALHES
          const TituloSecao(titulo: 'Detalhes'),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.water_drop, color: Colors.blue),
              Icon(Icons.air, color: Colors.blue),
              Icon(Icons.umbrella, color: Colors.blue),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('65%'),
                Text('12 km/h'),
                Text('30%'),
              ],
            ),
          ),

          const Divider(),

          // BOTÃO ATUALIZAR
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Atualizar'),
            ),
          ),

          const SizedBox(height: 16),

          // ÚLTIMA ATUALIZAÇÃO
          Container(
            height: 80,
            color: Colors.grey.shade200,
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Última atualização: 14:30',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
