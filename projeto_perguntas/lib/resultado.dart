import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(
      {super.key,
      required this.pontuacao,
      required this.reiniciarQuestionario});

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Poderia ter sido melhor!';
    } else {
      return 'Voce e bom!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
            onPressed: reiniciarQuestionario, child: const Text("Reiniciar"))
      ],
    );
  }
}
