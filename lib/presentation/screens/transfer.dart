import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xff6717CD),
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Transactions",
                        style: TextStyle(
                            fontFamily: 'Coolvetica',
                            color: Colors.white,
                            fontSize: 32),
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    BtnTransfer(iconname: Icons.send, name: "Transfer"),
                    BtnTransfer(
                        iconname: Icons.account_balance_wallet_outlined,
                        name: "Withdraw")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Recently people",
                          style: TextStyle(
                              fontFamily: 'Coolvetica',
                              color: Colors.white,
                              fontSize: 32),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: 10), // Espacio inicial de width: 10
                        ...List<Widget>.generate(usuarios.length * 2 - 1,
                            (index) {
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
