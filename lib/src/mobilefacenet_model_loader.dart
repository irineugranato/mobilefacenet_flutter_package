
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class MobileFaceNetModelLoader {
  MobileFaceNetModelLoader._();

  static const String modelAssetPath =
      'packages/mobilefacenet_flutter_package/assets/models/mobilefacenet.tflite';

  static Future<Interpreter> loadInterpreter({
    InterpreterOptions? options,
  }) async {
    final byteData = await rootBundle.load(modelAssetPath);

    final buffer = byteData.buffer.asUint8List(
      byteData.offsetInBytes,
      byteData.lengthInBytes,
    );

    return Interpreter.fromBuffer(
      buffer,
      options: options,
    );
  }
}