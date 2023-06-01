import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    var respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta'].map((resp) => Resposta(
            texto: resp['texto'] as String,
            onSelect: () => responder(resp['nota'])))
        : null;

    return Column(
      children: [
        Questao(texto: perguntas[perguntaSelecionada]['texto']),
        ...respostas,
      ],
    );
  }
}
