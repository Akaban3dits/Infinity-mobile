import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/screens/login.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); 
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const Infinity());
  });
}

class Infinity extends StatelessWidget {
  const Infinity({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinity',
      home: Login(),
    );
  }
}
