import 'package:tflite_flutter/tflite_flutter.dart';

class MobileFaceNetModelLoader {
  MobileFaceNetModelLoader._();

  static const String modelAssetPath =
      'assets/models/mobilefacenet.tflite';

  static Future<Interpreter> loadInterpreter({
    InterpreterOptions? options,
  }) async {
    return Interpreter.fromAsset(
      modelAssetPath,
      options: options,
    );
  }
}