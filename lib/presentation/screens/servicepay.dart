import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/servicepay.dart';
import 'package:intl/intl.dart';

class Payserv extends StatefulWidget {
  const Payserv(
      {super.key,
      required this.image,
      required this.name,
      required this.ref,
      required this.idservice});
  final String name;
  final String image;
  final String ref;
  final int idservice;

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
      ),
      body: Referencia(
          image: widget.image,
          name: widget.name,
          referencia: widget.ref,
          idService: widget.idservice),
    );
  }
}
