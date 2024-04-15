import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/servicepay.dart';
import 'package:intl/intl.dart';

class Payserv extends StatefulWidget {
  const Payserv({super.key, required this.image, required this.name, required this.ref});
  final String name;
  final String image;
  final String ref;

  @override
  State<Payserv> createState() => _PayservState();
}

class _PayservState extends State<Payserv> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat('dd-MM-yyyy').format(now);

    return Scaffold(
        backgroundColor: AppColorStyle.primary,
        appBar: AppBar(
          backgroundColor: AppColorStyle.primary,
          iconTheme: const IconThemeData(color: AppColorStyle.white),
        ), body: Referencia(image: widget.image, name: widget.name, lbl: "Referencia", lbl2: widget.ref),);
  }
}

class Paymovil extends StatefulWidget {
  const Paymovil({super.key, required this.image, required this.name, required this.ref});

  final String name;
  final String image;
  final String ref;

  @override
  State<Paymovil> createState() => _PaymovilState();
}

class _PaymovilState extends State<Paymovil> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      body: Referencia(image: widget.image, name: widget.name, lbl: "Numero de telefono", lbl2: widget.ref)
    );
  }
}


class Paystr extends StatefulWidget {
  const Paystr({super.key, required this.image, required this.name, required this.ref});

  final String name;
  final String image;
  final String ref;

  @override
  State<Paystr> createState() => _PaystrState();
}

class _PaystrState extends State<Paystr> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat('dd-MM-yyyy').format(now);
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      body: Referencia(image: widget.image, name: widget.name, lbl: "Numero de cliente", lbl2: widget.ref)
    );
  }
}