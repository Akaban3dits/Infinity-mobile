import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity_bank/domain/entities/movements.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
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
                      onPressed: () => _display(context, "Numero de cuenta")),
                  BtnTransfer(
                      iconname: Icons.compare_arrows_sharp,
                      name: "Entre cuentas",
                      onPressed: () => display2(context, "Referencia"))
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
                      onPressed: () => _display(context, "Referencia")),
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

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController body2Controller = TextEditingController();

  Future _display(BuildContext context, String label) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: AppColorStyle.secundary2,
        barrierColor: Colors.black38.withOpacity(0),
        isDismissible: true,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SizedBox(width: 30),
                    Text(label,
                        style: AppTextStyles.h3s1
                            .copyWith(color: AppColorStyle.white))
                  ]),
                  SizedBox(
                    height: 60,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 6),
                        child: SizedBox(
                          height: 60,
                          child: TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              fillColor: AppColorStyle.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Ingresa tu $label',
                              hintStyle: AppTextStyles.h4s1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SizedBox(width: 30),
                    Text("Monto",
                        style: AppTextStyles.h3s1
                            .copyWith(color: AppColorStyle.white))
                  ]),
                  SizedBox(
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Text("\$",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 6, bottom: 6),
                              child: TextField(
                                controller: bodyController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor: AppColorStyle.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: 'Ingresa tu monto',
                                    hintStyle: AppTextStyles.h4s1),
                              ),
                            ),
                          ),
                          Text(".",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white)),
                          SizedBox(
                            width: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 15, top: 6, bottom: 6),
                              child: TextField(
                                controller: body2Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 2,
                                decoration: InputDecoration(
                                  counterText: "",
                                  fillColor: AppColorStyle.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: '00',
                                  hintStyle: AppTextStyles.h4s1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                String title = titleController.text.trim();
                                String bodyAmount = bodyController.text.trim();
                                String body2Amount =
                                    body2Controller.text.trim();
                                if (title.isNotEmpty && bodyAmount.isNotEmpty) {
                                  if (body2Amount.isEmpty) {
                                    body2Amount = '00';
                                  }
                                  String body =
                                      "Se ha enviado el pago con $label a $title con valor de \$$bodyAmount.$body2Amount";
                                  NotificationService.showNotification(body);
                                  bodyController.clear();
                                  body2Controller.clear();
                                  titleController.clear();
                                  Navigator.pop(context);
                                } else {
                                  titleController.clear();
                                  bodyController.clear();
                                  body2Controller.clear();
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColorStyle.primary)),
                              child: Text(
                                "Enviar",
                                style: AppTextStyles.h4s1
                                    .copyWith(color: AppColorStyle.white),
                              )),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            child: Text(
                              "Cancel operation",
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Future<void> display2(BuildContext context, String label) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColorStyle.secundary2,
      barrierColor: Colors.black38.withOpacity(0),
      isDismissible: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        // Mantiene el estado dentro del modal
        CardName? selectedCard = CardList.first;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SizedBox(width: 30),
                    Text("Selecciona tu cuenta",
                        style: AppTextStyles.h3s1
                            .copyWith(color: AppColorStyle.white))
                  ]),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 6),
                      child: DropdownButton<CardName>(
                        isExpanded: true,
                        value: selectedCard,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (CardName? newValue) {
                          setState(() {
                            selectedCard = newValue;
                          });
                        },
                        items: CardList.map<DropdownMenuItem<CardName>>(
                            (CardName card) {
                          return DropdownMenuItem<CardName>(
                            value: card,
                            child: Text(
                              "**** **** **** ${card.account}",
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.secundary),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          Text("\$",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 6, bottom: 6),
                              child: TextField(
                                controller: bodyController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor: AppColorStyle.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    hintText: 'Ingresa tu monto',
                                    hintStyle: AppTextStyles.h4s1),
                              ),
                            ),
                          ),
                          Text(".",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white)),
                          SizedBox(
                            width: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 15, top: 6, bottom: 6),
                              child: TextField(
                                controller: body2Controller,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                maxLength: 2,
                                decoration: InputDecoration(
                                  counterText: "",
                                  fillColor: AppColorStyle.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: '00',
                                  hintStyle: AppTextStyles.h4s1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                String bodyAmount = bodyController.text.trim();
                                String body2Amount =
                                    body2Controller.text.trim();

                                if (bodyAmount.isNotEmpty) {
                                  if (body2Amount.isEmpty) {
                                    body2Amount = '00';
                                  }
                                  if (selectedCard != null) {
                                    String account = selectedCard!.account;
                                    String body =
                                        "Se ha enviado el pago a la cuenta con numero **** **** **** $account con valor de \$$bodyAmount.$body2Amount";
                                    NotificationService.showNotification(body);
                                    bodyController.clear();
                                    body2Controller.clear();
                                    Navigator.pop(context);
                                  }
                                } else {
                                  bodyController.clear();
                                  body2Controller.clear();
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColorStyle.primary)),
                              child: Text(
                                "Enviar",
                                style: AppTextStyles.h4s1
                                    .copyWith(color: AppColorStyle.white),
                              )),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                            onPressed: () {
                              bodyController.clear();
                              body2Controller.clear();
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            child: Text(
                              "Cancel operation",
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
