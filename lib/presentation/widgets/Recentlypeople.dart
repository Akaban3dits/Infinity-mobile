// ignore_for_file: avoid_unnecessary_containers, unnecessary_import, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class ButtonPearson extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const ButtonPearson(
      // ignore: non_constant_identifier_names
      {super.key,
      // ignore: non_constant_identifier_names
      required this.link_image_profile,
      required this.name,
      // ignore: non_constant_identifier_names
      required this.account_num});
  final String name;
  // ignore: non_constant_identifier_names
  final String link_image_profile;
  // ignore: non_constant_identifier_names
  final int account_num;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
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
                link_image_profile,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.white, fontFamily: 'Coolvetica', fontSize: 15),
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            fixedSize: const Size(100, 110),
            backgroundColor: const Color(0xff16035C)),
      ),
    );
  }

  Future _display(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: const Color(0xff16045D),
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
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          "Concepto",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Coolvetica',
                              fontSize: 20),
                        )
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
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Ingresa tu concepto',
                              hintStyle: const TextStyle(
                                  fontFamily: 'Coolvetica', fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          "Monto",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Coolvetica',
                              fontSize: 20),
                        )
                      ]),
                  Container(
                    height: 75,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: <Widget>[
                          const Text("\$",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Coolvetica',
                                  fontSize: 22)),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 6, bottom: 6),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: 'Ingresa tu monto',
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Coolvetica', fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          const Text(".",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Coolvetica',
                                  fontSize: 20)),
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
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintText: '00',
                                  hintStyle: const TextStyle(
                                      fontFamily: 'Coolvetica', fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          "Transferencia a:",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Coolvetica',
                              fontSize: 20),
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
                                color: const Color(0xff6717CD),
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
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Coolvetica')),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            account_num.toString(),
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Monofonto'),
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
                                                    const Color(0xffD9D9D9))),
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
                              style: TextStyle(
                                  fontFamily: 'Coolvetica',
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
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
