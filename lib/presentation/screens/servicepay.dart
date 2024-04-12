import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/servicepay.dart';
import 'package:intl/intl.dart';

class Payserv extends StatefulWidget {
  const Payserv({super.key, required this.image, required this.name});
  final String name;
  final String image;

  @override
  State<Payserv> createState() => _PayservState();
}

class _PayservState extends State<Payserv> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return Scaffold(
        backgroundColor: AppColorStyle.primary,
        appBar: AppBar(
          backgroundColor: AppColorStyle.primary,
          iconTheme: const IconThemeData(color: AppColorStyle.white),
        ), body: Referencia(image: widget.image, name: widget.name),);
  }
}

class Paymovil extends StatefulWidget {
  const Paymovil({super.key, required this.image, required this.name});

  final String name;
  final String image;

  @override
  State<Paymovil> createState() => _PaymovilState();
}

class _PaymovilState extends State<Paymovil> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        title: Text(widget.name),
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      body: Referencia(image: widget.image, name: widget.name)
    );
  }
}
