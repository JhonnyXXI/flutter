import 'package:flutter/material.dart';

import '../widgets/titulo_secao.dart';

class DetalhesAvancadosScreen extends StatelessWidget {
  const DetalhesAvancadosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes avançados'),
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ALERTAS
          const TituloSecao(titulo: 'Alertas'),

          Card(
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.orange),
              title: const Text('Chuva forte'),
              subtitle: const Text('Previsto para hoje, a partir das 18h'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.air, color: Colors.blue),
              title: const Text('Ventos fortes'),
              subtitle: const Text('Rajadas de vento durante a tarde'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),

          const Divider(),

          // INDICADORES
          const TituloSecao(titulo: 'Indicadores'),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            children: const [
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.orange),
                    Text('6', style: TextStyle(fontSize: 24)),
                    Text('Índice UV'),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.speed, color: Colors.blue),
                    Text('1013 hPa', style: TextStyle(fontSize: 24)),
                    Text('Pressão'),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.visibility, color: Colors.green),
                    Text('10 km', style: TextStyle(fontSize: 24)),
                    Text('Visibilidade'),
                  ],
                ),
              ),

              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wb_twilight, color: Colors.orange),
                    Text('06:15', style: TextStyle(fontSize: 24)),
                    Text('Nascer do sol'),
                  ],
                ),
              ),
            ],
          ),

          const Divider(),

          // CONDIÇÃO DO TEMPO
          const TituloSecao(titulo: 'Condição do tempo'),

          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Image.network(
                  'https://picsum.photos/seed/picsum/200/300',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.blueGrey,
                    );
                  },
                ),

                const Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    '26°C',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 20, 3, 121),
                      shadows: [Shadow(color: Colors.black, blurRadius: 6)],
                    ),
                  ),
                ),

                const Positioned(
                  top: 16,
                  right: 16,
                  child: Icon(Icons.wb_cloudy, color: Colors.white, size: 32),
                ),
              ],
            ),
          ),

          const Divider(),

          // TAGS
          const TituloSecao(titulo: 'Tags'),

          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(
                avatar: Icon(Icons.water_drop, size: 18),
                label: Text('Chuva forte'),
              ),

              Chip(
                avatar: Icon(Icons.wb_sunny, size: 18),
                label: Text('UV alto'),
              ),

              Chip(label: Text('Vento moderado')),

              Chip(label: Text('Umidade alta')),

              Chip(label: Text('Frente fria')),
            ],
          ),
        ],
      ),
    );
  }
}
