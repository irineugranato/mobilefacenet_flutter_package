import 'package:flutter/material.dart';
import 'package:mobilefacenet_flutter_package/mobilefacenet_flutter_package.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String status = 'Carregando modelo...';

  @override
  void initState() {
    super.initState();
    _testModel();
  }

  Future<void> _testModel() async {
    try {
      final interpreter = await MobileFaceNetModelLoader.loadInterpreter(
        options: InterpreterOptions()..threads = 2,
      );

      final inputShape = interpreter.getInputTensor(0).shape;
      final outputShape = interpreter.getOutputTensor(0).shape;

      setState(() {
        status =
            'Modelo carregado com sucesso\nInput: $inputShape\nOutput: $outputShape';
      });
    } catch (e) {
      setState(() {
        status = 'Erro ao carregar modelo:\n$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              status,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}