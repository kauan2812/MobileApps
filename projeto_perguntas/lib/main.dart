import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PerguntasApp());

class _PerguntaAppState extends State<PerguntasApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;

  void _responder(int nota) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }

    print(_notaTotal);
  }

  final List<Map> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'resposta': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Azul', 'nota': 5},
        {'texto': 'Branco', 'nota': 3},
        {'texto': 'Amarelo', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'resposta': [
        {'texto': 'Elefante', 'nota': 10},
        {'texto': 'Girafa', 'nota': 5},
        {'texto': 'Cachorro', 'nota': 3},
        {'texto': 'Macaco', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual seu instrutor favorito?',
      'resposta': [
        {'texto': 'Maria', 'nota': 10},
        {'texto': 'Leo', 'nota': 5},
        {'texto': 'Roberto', 'nota': 3},
        {'texto': 'Roger', 'nota': 1},
      ],
    },
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(
                  pontuacao: _notaTotal,
                  reiniciarQuestionario: _reiniciarQuestionario,
                )),
    );
  }
}

class PerguntasApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
