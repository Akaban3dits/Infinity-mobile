// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';

// ButtonPearson ahora es StatefulWidget.
class ButtonPearson extends StatefulWidget {
  final String name;
  // ignore: non_constant_identifier_names
  final String link_image_profile;
  // ignore: non_constant_identifier_names
  final int account_num;

  const ButtonPearson(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.link_image_profile,
      required this.name,
      // ignore: non_constant_identifier_names
      required this.account_num});

  @override
  // ignore: library_private_types_in_public_api
  _ButtonPearsonState createState() => _ButtonPearsonState();
}

class _ButtonPearsonState extends State<ButtonPearson> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController body2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _display(context);
      },
      // ignore: sort_child_properties_last
      child: Column(
        children: <Widget>[
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget
                  .link_image_profile, // Acceso a las variables a través de 'widget.'
              width: 60,
              height: 60,
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
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fixedSize: const Size(100, 110),
        backgroundColor: AppColorStyle.secundary2,
      ),
    );
  }

  Future _display(BuildContext context) {
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
                    Text("Concepto",
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
                              hintText: 'Ingresa tu concepto',
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
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SizedBox(width: 30),
                    Text(
                      "Transferencia a:",
                      style: AppTextStyles.h3s1
                          .copyWith(color: AppColorStyle.white),
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            width: 370,
                            height: 80,
                            decoration: BoxDecoration(
                                color: AppColorStyle.primary,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(width: 15),
                                  Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          widget.link_image_profile,
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(widget.name,
                                              style: AppTextStyles.h4s1
                                                  .copyWith(
                                                      color:
                                                          AppColorStyle.white)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            widget.account_num.toString(),
                                            style: AppTextStyles.h4s2.copyWith(
                                                color: AppColorStyle.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if (titleController.text.isNotEmpty &&
                                              bodyController.text.isNotEmpty) {
                                            String cents =
                                                body2Controller.text.isEmpty
                                                    ? "00"
                                                    : body2Controller.text;
                                            String body =
                                                "Has enviado \$${bodyController.text}.$cents a ${widget.name}";

                                            NotificationService
                                                .showNotification(body);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Por favor complete los campos de concepto y monto'),
                                            ));
                                          }
                                        },
                                        icon: const Icon(Icons.send),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppColorStyle.white)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 10)
                                ],
                              )
                            ])),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
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

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }
}
