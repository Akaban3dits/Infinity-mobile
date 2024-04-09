import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class Btnservice extends StatefulWidget {
  const Btnservice({super.key, required this.name, required this.url});
  final String url;
  final String name;
  @override
  State<Btnservice> createState() => _BtnserviceState();
}

class _BtnserviceState extends State<Btnservice> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          fixedSize: const Size(100, 110),
          backgroundColor: AppColorStyle.secundary2),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          ClipRRect(
            child: Image.network(
              widget.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.name,
            style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
          )
        ],
      ),
    );
  }
}
