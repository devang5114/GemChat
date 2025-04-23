import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gemchat/core/config/route/app_route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const GemaChatApp());
}

class GemaChatApp extends StatelessWidget {
  const GemaChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute:AppRouteManager.onGenerateRoute ,
      home: Scaffold(
        
      ),
    );
  }
}
