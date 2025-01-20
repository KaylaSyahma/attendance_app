import 'package:attendance_app/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      // data diambil dri file google.services.json
      apiKey:  "AIzaSyDw-1OklhMbSqTy25KjR7x_QZpE8wkJybM", //current key
      appId: "1:250012638481:android:4a66e31241bfc0fae680b0", //mobile_sdk_app dri json
      messagingSenderId: "250012638481", //project number dri json
      projectId: "attendance-app-b1376" //project_id dri json
    )
  );
  runApp(const AttendanceApp());
}

// initializeapp harus dipanggil sebelum kita memanggil layanan firebase lainnya

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cardTheme: CardTheme(surfaceTintColor: Colors.white,),
        dialogTheme: DialogTheme(surfaceTintColor: Colors.white, backgroundColor: Colors.white,),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}