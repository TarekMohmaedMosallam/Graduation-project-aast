
import 'dart:io';
import 'dart:typed_data';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class HomePageAi extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePageAi> {
  final ImagePicker _picker = ImagePicker();
  Interpreter? _interpreter;
  bool _isModelLoaded = false;
  File? _image;
  String _diseaseName = "";
  String _confidenceRate = "";
  List<String> _labels = ['Blast', 'Blight', 'Brownspot'];
  final double _confidenceThreshold = 70.0; // Adjust threshold for better accuracy

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      var options = InterpreterOptions();
      options.useNnApiForAndroid = true; // Optimize for Android
      _interpreter = await Interpreter.fromAsset('asset/best_float32 (1).tflite', options: options);
      if (mounted) {
        setState(() {
          _isModelLoaded = true;
        });
      }
      print("Model loaded successfully");
    } catch (e) {
      print("Error loading model: $e");
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      _performInference(File(image.path));
    }
  }

  Future<void> _performInference(File imageFile) async {
    if (!_isModelLoaded || _interpreter == null) return;

    try {
      var inputTensor = _interpreter!.getInputTensor(0);
      var inputShape = inputTensor.shape;

      print("Input tensor shape: $inputShape");

      img.Image? image = img.decodeImage(await imageFile.readAsBytes());
      if (image == null) {
        print("Image is null");
        return;
      }

      int inputSize = inputShape[1];
      img.Image resizedImage = img.copyResize(image, width: inputSize, height: inputSize);

      // Normalize image data
      var inputImage = Float32List(inputSize * inputSize * 3);
      var buffer = Float32List.view(inputImage.buffer);
      int index = 0;
      for (var y = 0; y < inputSize; y++) {
        for (var x = 0; x < inputSize; x++) {
          var pixel = resizedImage.getPixel(x, y);
          buffer[index++] = (img.getRed(pixel) / 127.5) - 1.0; // Normalize to [-1, 1]
          buffer[index++] = (img.getGreen(pixel) / 127.5) - 1.0; // Normalize to [-1, 1]
          buffer[index++] = (img.getBlue(pixel) / 127.5) - 1.0; // Normalize to [-1, 1]
        }
      }

      // Ensure correct input shape
      var input = inputImage.reshape([1, inputSize, inputSize, 3]);

      // Adjust output shape according to your model
      var output = List.filled(7 * 8400, 0.0).reshape([1, 7, 8400]);

      _interpreter!.run(input, output);

      // Cast output to List<List<List<double>>> for correct typing
      List<List<List<double>>> outputList = output.cast<List<List<double>>>();

      // Debug output values
      print("Model raw output: ${outputList[0].sublist(0, 5)}");

      String detectedDisease = _getDiseaseName(outputList);
      double confidence = _getConfidence(outputList);

      if (mounted) {
        setState(() {
          _diseaseName = confidence >= _confidenceThreshold ? detectedDisease : "Unknown Disease";
          _confidenceRate = confidence.toStringAsFixed(2) + "%";
        });
      }
      print("Detected disease: $_diseaseName with confidence: $_confidenceRate");
    } catch (e) {
      print("Error during inference: $e");
    }
  }

  String _getDiseaseName(List<List<List<double>>> output) {
    if (output.isEmpty) {
      return "Unknown Disease";
    }

    // Group the output probabilities and map them to our labels
    int groups = output[0][0].length ~/ _labels.length;
    List<double> probabilities = List.filled(_labels.length, 0.0);

    for (int i = 0; i < _labels.length; i++) {
      for (int j = 0; j < groups; j++) {
        probabilities[i] += output[0][0][i * groups + j];
      }
    }

    // Get the index with the highest probability
    int maxIndex = 0;
    double maxConfidence = double.negativeInfinity;
    for (int i = 0; i < probabilities.length; i++) {
      if (probabilities[i] > maxConfidence) {
        maxConfidence = probabilities[i];
        maxIndex = i;
      }
    }

    print("Max index: $maxIndex with confidence: $maxConfidence");
    return _labels[maxIndex];
  }

  double _getConfidence(List<List<List<double>>> output) {
    if (output.isEmpty) {
      return 0.0;
    }

    // Group the output probabilities and map them to our labels
    int groups = output[0][0].length ~/ _labels.length;
    List<double> probabilities = List.filled(_labels.length, 0.0);

    for (int i = 0; i < _labels.length; i++) {
      for (int j = 0; j < groups; j++) {
        probabilities[i] += output[0][0][i * groups + j];
      }
    }

    // Get the highest probability
    double maxConfidence = probabilities.reduce((a, b) => a > b ? a : b);

    // Debug confidence score
    print("Confidence score: $maxConfidence");
    return maxConfidence * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: _isModelLoaded
            ? SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? Text('No image selected.')
                  : Column(
                children: [
                  Image.file(_image!, height: 300),
                  SizedBox(height: 20),
                  Text('Detected Disease: $_diseaseName', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  //Text('Confidence: $_confidenceRate', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Text('Capture Image'),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Select from Gallery'),
              ),
            ],
          ),
        )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _interpreter?.close();
    super.dispose();
  }
}
