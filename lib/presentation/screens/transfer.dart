import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
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
                      "Transactions",
                      style: AppTextStyles.h1s1
                          .copyWith(color: AppColorStyle.white),
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  BtnTransfer(iconname: AppIconStyle.send, name: "Transfer"),
                  BtnTransfer(iconname: AppIconStyle.withdraw, name: "Withdraw")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Recently people",
                        style: AppTextStyles.h1s1
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
