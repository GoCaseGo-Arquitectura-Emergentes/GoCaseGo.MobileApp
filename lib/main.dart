import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_case_go/SignInScreen/sign_in_screen.dart';
import 'package:go_case_go/api/firebase_api.dart';
import 'package:go_case_go/config/local_storage.dart';
import 'package:go_case_go/sensor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "",
        authDomain: "",
        projectId: "",
        storageBucket: "",
        messagingSenderId: "",
        appId: "",
        measurementId: ""),
  );
  await FirebaseApi().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Case Go',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 108, 196, 202)),
        useMaterial3: true,
      ),
      home: const SensorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
