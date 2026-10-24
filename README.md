## Atividade 3 - Novos Widgets

| Widget | Para que serve | Propriedades e o que fazem | Documentação |
|---|---|---|---|
| Card | Cria cartões. | child: conteúdo; color: cor do cartão. | [Card](https://api.flutter.dev/flutter/material/Card-class.html) |
| ListTile | Organiza textos e ícones. | leading: ícone à esquerda; trailing: ícone à direita. | [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html) |
| GridView.count | Organiza itens em colunas. | crossAxisCount: número de colunas; shrinkWrap: ajusta o tamanho. | [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html) |
| Stack | Coloca elementos um em cima do outro. | children: elementos; alignment: alinhamento. | [Stack](https://api.flutter.dev/flutter/widgets/Stack-class.html) |
| Positioned | Define a posição dos elementos. | top: distância do topo; left: distância da esquerda. | [Positioned](https://api.flutter.dev/flutter/widgets/Positioned-class.html) |
| Wrap | Organiza itens e quebra a linha quando necessário. | spacing: espaço entre itens; runSpacing: espaço entre linhas. | [Wrap](https://api.flutter.dev/flutter/widgets/Wrap-class.html) |
| Chip | Cria etiquetas. | label: texto; avatar: ícone ou imagem. | [Chip](https://api.flutter.dev/flutter/material/Chip-class.html) |

### Qual a diferença entre Row, Column e Stack? Quando usar cada um?

O Row organiza os elementos na horizontal, o Column na vertical e o Stack permite colocar um elemento em cima do outro.

Uso Row e Column para organizar a tela e Stack quando preciso colocar alguma informação por cima de uma imagem.