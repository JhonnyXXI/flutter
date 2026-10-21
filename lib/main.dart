import 'package:flutter/material.dart';

import 'widgets/titulo_secao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WeatherApp'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Cidade atual
            const TituloSecao(titulo: 'Cidade atual'),
            const Text(
              'Cidade de Cerulean, Kanto',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Terça-feira, 20 de outubro',
              style: TextStyle(fontSize: 16),
            ),

            const Divider(),

            // Temperatura
            const TituloSecao(titulo: 'Temperatura'),
            const Text(
              '26°C',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const Text(
              'Sensação térmica: 28°C',
              style: TextStyle(fontSize: 16),
            ),

            const Divider(),

            // Condição do tempo
            const TituloSecao(titulo: 'Condição do tempo'),
            Image.network(
              'https://picsum.photos/id/870/200/300?grayscale&blur=2',
              height: 200,
            ),

            const Divider(),

            // Detalhes
            const TituloSecao(titulo: 'Detalhes'),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.water_drop, size: 32, color: Colors.blue),
                Icon(Icons.air, size: 32, color: Colors.grey),
                Icon(Icons.umbrella, size: 32, color: Colors.purple),
              ],
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('65%'), Text('12 km/h'), Text('30%')],
            ),

            const Divider(),

            // Atualização
            const TituloSecao(titulo: 'Atualização'),
            ElevatedButton(onPressed: () {}, child: const Text('Atualizar')),
          ],
        ),
      ),
    );
  }
}
