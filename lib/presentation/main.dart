import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/screens/login.dart';

void main() => runApp(const Infinity());

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