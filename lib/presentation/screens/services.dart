import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infinity_bank/domain/entities/services.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/servicebuttons.dart';

class ServicesArea extends StatefulWidget {
  const ServicesArea({super.key});

  @override
  State<ServicesArea> createState() => _ServicesAreaState();
}

class _ServicesAreaState extends State<ServicesArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        title: Text("Pago de servicios",
            style: AppTextStyles.h1s1.copyWith(color: AppColorStyle.white)),
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Streaming",
                    style:
                        AppTextStyles.h2s1.copyWith(color: AppColorStyle.white))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: streaming.length,
                  itemBuilder: (context, index) {
                    final svc = streaming[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Btnservice(name: svc.servname, url: svc.url),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
