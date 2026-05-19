# mobilefacenet_flutter_package

Package Flutter para embutir o arquivo `mobilefacenet.tflite` e carregá-lo a partir de outro projeto Flutter/FlutterFlow.

## Estrutura esperada

```text
mobilefacenet_flutter_package/
  assets/
    models/
      mobilefacenet.tflite
  lib/
    mobilefacenet_flutter_package.dart
  pubspec.yaml
```

## Passo 1: adicionar o modelo

Copie o arquivo:

```text
mobilefacenet.tflite
```

para:

```text
assets/models/mobilefacenet.tflite
```

## Passo 2: publicar no Git privado

```bash
git init
git add .
git commit -m "Add MobileFaceNet Flutter package"
git branch -M main
git remote add origin git@github.com:SUA_ORG/mobilefacenet_flutter_package.git
git push -u origin main
```

## Passo 3: usar em outro projeto Flutter

No `pubspec.yaml` do app principal:

```yaml
dependencies:
  mobilefacenet_flutter_package:
    git:
      url: git@github.com:SUA_ORG/mobilefacenet_flutter_package.git
      ref: main
```

## Passo 4: carregar o modelo

```dart
import 'package:mobilefacenet_flutter_package/mobilefacenet_flutter_package.dart';

final interpreter = await MobileFaceNetModelLoader.loadInterpreter();
```

## Uso esperado no FlutterFlow

Depois de adicionar este package como dependência customizada, importe:

```dart
import 'package:mobilefacenet_flutter_package/mobilefacenet_flutter_package.dart';
```

E substitua o carregamento manual:

```dart
_interpreter = await Interpreter.fromAsset(widget.modelAssetPath);
```

por:

```dart
_interpreter = await MobileFaceNetModelLoader.loadInterpreter();
```
