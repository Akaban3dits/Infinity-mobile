// ignore: file_names
// ignore: file_names
// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class ButtonPearson extends StatelessWidget {
  const ButtonPearson(
      {super.key,
      required this.link_image_profile,
      required this.name,
      required this.account_num});
  final String name;
  final String link_image_profile;
  final int account_num;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          _display(context);
        },
        child: Column(
          children: <Widget>[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                link_image_profile,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: const Size(100, 110),
            backgroundColor: AppColorStyle.secundary2),
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
                  Container(
                    height: 60,
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 6),
                        child: Container(
                          height: 60,
                          child: TextField(
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
                  Container(
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
                          Container(
                            width: 80,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 15, top: 6, bottom: 6),
                              child: TextField(
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
                                          link_image_profile,
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
                                          Text(name,
                                              style: AppTextStyles.h4s1
                                                  .copyWith(
                                                      color:
                                                          AppColorStyle.white)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            account_num.toString(),
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
                                        onPressed: () {},
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
                            child: Text(
                              "Cancel operation",
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white),
                            ),
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)))
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
