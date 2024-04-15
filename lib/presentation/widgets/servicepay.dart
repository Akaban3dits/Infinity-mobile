import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:intl/intl.dart';

class Referencia extends StatefulWidget {
  const Referencia({super.key, required this.image, required this.name, required this.lbl, required this.lbl2});
  final String name;
  final String image;
  final String lbl;
  final String lbl2;

  @override
  State<Referencia> createState() => _ReferenciaState();
}

class _ReferenciaState extends State<Referencia> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    return Center(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                widget.image,
                fit: BoxFit.fill,
                width: 200,
              ),
            )
          ]),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: AppColorStyle.secundary2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.name,
                          style: AppTextStyles.h1s1
                              .copyWith(color: AppColorStyle.white),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                widget.lbl,
                                style: AppTextStyles.h3s1
                                    .copyWith(color: AppColorStyle.white),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              widget.lbl2,
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: AppColorStyle.white.withOpacity(0.5),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(children: [
                            Text(
                              "Concepto",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white),
                            )
                          ]),
                        ),
                        Expanded(
                            child: Column(children: [
                          Text(
                            "Servicio",
                            style: AppTextStyles.h4s1
                                .copyWith(color: AppColorStyle.white),
                          )
                        ]))
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: AppColorStyle.white.withOpacity(0.5),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(children: [
                            Text(
                              "Monto a pagar",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white),
                            )
                          ]),
                        ),
                        Expanded(
                            child: Column(children: [
                          Text(
                            "\$500.54",
                            style: AppTextStyles.h4s1
                                .copyWith(color: AppColorStyle.white),
                          )
                        ]))
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: AppColorStyle.white.withOpacity(0.5),
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(children: [
                            Text(
                              "Fecha",
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white),
                            )
                          ]),
                        ),
                        Expanded(
                            child: Column(children: [
                          Text(
                            formattedDate,
                            style: AppTextStyles.h4s1
                                .copyWith(color: AppColorStyle.white),
                          )
                        ]))
                      ],
                    ),
                  ),
                  Expanded(child: Container(color: Colors.transparent)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          onPressed: () {
                            String body = "El pago a ${widget.name} con referencia a ${widget.lbl2} de \$500.54 ha sido exitoso";
                            NotificationService.showNotification(body);
                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColorStyle.primary)),
                          child: Text(
                            "Pagar",
                            style: AppTextStyles.h3s1
                                .copyWith(color: AppColorStyle.white),
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
