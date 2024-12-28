import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'final_project/presentation/pages/Temp.dart';
import 'final_project/presentation/widgets/Manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AwesomeNotifications

  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCCUm93q3Qp7kC1pkqylOPnT1KGgYAXcXw",
      appId: "1:147839102164:android:0425991a532f2f9e4adf41",
      messagingSenderId: "147839102164",
      projectId: "gradeproject-ecfe7",
    ),
  );

  // Check connection (model loading)
  bool isModelLoaded = await checkConnection();
  print(isModelLoaded ? "Model loaded successfully" : "Failed to load model");

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

Future<bool> checkConnection() async {
  try {
    final interpreter = await Interpreter.fromAsset('asset/Ai_Model/model.tflite');
    interpreter.close();
    return true;
  } catch (e) {
    print("Error loading model: $e");
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MangerUI(),
      builder: DevicePreview.appBuilder,
    );
  }
}
