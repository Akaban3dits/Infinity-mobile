import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/services.dart';
import 'package:infinity_bank/presentation/widgets/buttontransfer.dart';
import 'package:infinity_bank/domain/entities/people.dart';
import 'package:infinity_bank/presentation/widgets/Recentlypeople.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Movimientos",
                      style: AppTextStyles.h2s1
                          .copyWith(color: AppColorStyle.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  BtnTransfer(
                      iconname: AppIconStyle.send,
                      name: "Transferencia",
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ServicesArea()))
                          }),
                  BtnTransfer(
                      iconname: Icons.compare_arrows_sharp,
                      name: "Entre cuentas",
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ServicesArea()))
                          })
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Servicios",
                      style: AppTextStyles.h2s1
                          .copyWith(color: AppColorStyle.white),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  BtnTransfer(
                      iconname: Icons.lightbulb_outline,
                      name: "Servicios",
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ServicesArea()))
                          }),
                  BtnTransfer(
                      iconname: Icons.favorite,
                      name: "Donar",
                      onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ServicesArea()))
                          })
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Contactos Recientes",
                        style: AppTextStyles.h2s1
                            .copyWith(color: AppColorStyle.white),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const SizedBox(width: 10),
                  ...List<Widget>.generate(usuarios.length * 2 - 1, (index) {
                    if (index % 2 == 0) {
                      Usuario usuario = usuarios[index ~/ 2];
                      return ButtonPearson(
                        link_image_profile: usuario.url,
                        name: usuario.nombre,
                        account_num: usuario.numeroDeCuenta,
                      );
                    } else {
                      return const SizedBox(width: 10);
                    }
                  }),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
