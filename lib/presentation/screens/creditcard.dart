import 'package:flutter/material.dart';
import 'package:infinity_bank/domain/entities/movements.dart';
import 'package:infinity_bank/domain/entities/people.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/Recentlypeople.dart';
import 'package:infinity_bank/presentation/widgets/card.dart';
import 'package:infinity_bank/presentation/widgets/movesinformation.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Bienvenido, Joahan",
                style: AppTextStyles.h1s1.copyWith(color: AppColorStyle.white)
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Cuentas",
                style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CardList.length,
                itemBuilder: (context, index) {
                  final card = CardList[index];
                  return CCard(
                      money: card.money,
                      names: card.name,
                      vig: card.vig,
                      vig1: card.vig1,
                      account: card.account);
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    "Contactos recientes",
                    style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColorStyle.secundary2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Movimientos Recientes",
                            style: AppTextStyles.h3s2.copyWith(color: AppColorStyle.white)
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye_outlined),
                            color: AppColorStyle.white, 
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: MoveList.length,
                          itemBuilder: (context, index) {
                            final cl = MoveList[index];
                            return MovesData(
                              usuario: cl.usuario,
                              monto: cl.monto,
                              fecha: cl.fecha,
                              tipo: cl.tipo,
                              estado: cl.estado,
                              detalle: cl.detalle,
                              id: cl.id,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
