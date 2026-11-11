class PrevisaoDia {
  final String dia;
  final int minima;
  final int maxima;
  final String condicao;

  const PrevisaoDia({
    required this.dia,
    required this.minima,
    required this.maxima,
    required this.condicao,
  });
}

class Cidade {
  final String nome;
  final int temperatura;
  final int umidade;
  final int vento;
  final int chuva;
  final String condicao;
  final String imagem;
  final String alerta;
  final int indiceUv;
  final int pressao;
  final int visibilidade;
  final String nascerSol;
  final List<PrevisaoDia> previsao;

  const Cidade({
    required this.nome,
    required this.temperatura,
    required this.umidade,
    required this.vento,
    required this.chuva,
    required this.condicao,
    required this.imagem,
    required this.alerta,
    required this.indiceUv,
    required this.pressao,
    required this.visibilidade,
    required this.nascerSol,
    required this.previsao,
  });
}

// DADOS FICTÍCIOS DAS CIDADES DE KANTO
const List<Cidade> cidades = [
  Cidade(
    nome: 'Cerulean',
    temperatura: 26,
    umidade: 65,
    vento: 12,
    chuva: 30,
    condicao: 'Parcialmente chuvoso',
    imagem: 'https://picsum.photos/id/870/800/400',
    alerta: 'Possibilidade de chuva à tarde',
    indiceUv: 6,
    pressao: 1013,
    visibilidade: 10,
    nascerSol: '06:15',
    previsao: [
      PrevisaoDia(dia: 'Sexta', minima: 19, maxima: 30, condicao: 'Ensolarado'),
      PrevisaoDia(dia: 'Sábado', minima: 18, maxima: 27, condicao: 'Nublado'),
      PrevisaoDia(dia: 'Domingo', minima: 17, maxima: 24, condicao: 'Chuvoso'),
      PrevisaoDia(dia: 'Segunda', minima: 20, maxima: 28, condicao: 'Nublado'),
      PrevisaoDia(dia: 'Terça', minima: 21, maxima: 31, condicao: 'Ensolarado'),
    ],
  ),
  Cidade(
    nome: 'Pallet Town',
    temperatura: 27,
    umidade: 55,
    vento: 8,
    chuva: 10,
    condicao: 'Ensolarado',
    imagem: 'https://picsum.photos/id/167/800/400',
    alerta: 'Índice UV elevado',
    indiceUv: 8,
    pressao: 1015,
    visibilidade: 12,
    nascerSol: '06:10',
    previsao: [
      PrevisaoDia(dia: 'Sexta', minima: 20, maxima: 29, condicao: 'Ensolarado'),
      PrevisaoDia(
        dia: 'Sábado',
        minima: 21,
        maxima: 30,
        condicao: 'Ensolarado',
      ),
      PrevisaoDia(dia: 'Domingo', minima: 22, maxima: 31, condicao: 'Nublado'),
      PrevisaoDia(
        dia: 'Segunda',
        minima: 20,
        maxima: 28,
        condicao: 'Ensolarado',
      ),
      PrevisaoDia(dia: 'Terça', minima: 23, maxima: 32, condicao: 'Ensolarado'),
    ],
  ),
  Cidade(
    nome: 'Pewter City',
    temperatura: 22,
    umidade: 75,
    vento: 10,
    chuva: 45,
    condicao: 'Nublado',
    imagem: 'https://picsum.photos/id/1018/800/400',
    alerta: 'Possibilidade de chuva fraca',
    indiceUv: 3,
    pressao: 1018,
    visibilidade: 8,
    nascerSol: '06:20',
    previsao: [
      PrevisaoDia(dia: 'Sexta', minima: 17, maxima: 25, condicao: 'Nublado'),
      PrevisaoDia(dia: 'Sábado', minima: 16, maxima: 23, condicao: 'Chuvoso'),
      PrevisaoDia(dia: 'Domingo', minima: 15, maxima: 22, condicao: 'Nublado'),
      PrevisaoDia(
        dia: 'Segunda',
        minima: 18,
        maxima: 26,
        condicao: 'Ensolarado',
      ),
      PrevisaoDia(dia: 'Terça', minima: 17, maxima: 24, condicao: 'Nublado'),
    ],
  ),
  Cidade(
    nome: 'Vermilion City',
    temperatura: 29,
    umidade: 60,
    vento: 22,
    chuva: 15,
    condicao: 'Ensolarado com vento',
    imagem: 'https://picsum.photos/id/1015/800/400',
    alerta: 'Rajadas de vento durante a tarde',
    indiceUv: 7,
    pressao: 1010,
    visibilidade: 15,
    nascerSol: '06:05',
    previsao: [
      PrevisaoDia(dia: 'Sexta', minima: 21, maxima: 31, condicao: 'Ensolarado'),
      PrevisaoDia(dia: 'Sábado', minima: 22, maxima: 32, condicao: 'Ventando'),
      PrevisaoDia(
        dia: 'Domingo',
        minima: 23,
        maxima: 33,
        condicao: 'Ensolarado',
      ),
      PrevisaoDia(dia: 'Segunda', minima: 22, maxima: 30, condicao: 'Nublado'),
      PrevisaoDia(dia: 'Terça', minima: 24, maxima: 34, condicao: 'Ensolarado'),
    ],
  ),
];
