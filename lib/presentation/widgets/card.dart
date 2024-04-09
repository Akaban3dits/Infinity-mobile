import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/datacard.dart';
import 'package:intl/intl.dart';

class CCard extends StatefulWidget {
  const CCard(
      {super.key,
      required this.money,
      required this.names,
      required this.vig,
      required this.vig1,
      required this.account});
  final String names;
  final double money;
  final int vig;
  final int vig1;
  final String account;

  @override
  State<CCard> createState() => _CCardState();
}

class _CCardState extends State<CCard> {
  late String numeroConComas;
  @override
  void initState() {
    super.initState();
    // Formatea el número con comas y lo asigna a la variable
    numeroConComas = NumberFormat("#,##0.00", "en_US").format(widget.money);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        height: 180,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DataCard(
                        money: widget.money,
                        names: widget.names,
                        vig: widget.vig,
                        vig1: widget.vig1,
                        account: widget.account)));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(24, 22, 3, 92),
                  AppColorStyle.secundary
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/images/Logo Doble.png",
                                height: 30)
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$",
                                  style: AppTextStyles.h3s2
                                      .copyWith(color: AppColorStyle.white),
                                ),
                                Text(
                                  numeroConComas,
                                  style: AppTextStyles.h3s2
                                      .copyWith(color: AppColorStyle.white),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Image.network(
                          "https://cdn-icons-png.flaticon.com/512/6404/6404100.png",
                          width: 30,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("**** **** **** ${widget.account}",
                            style: AppTextStyles.h3s2
                                .copyWith(color: AppColorStyle.white)),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Vigencia",
                                    style: AppTextStyles.h3s2
                                        .copyWith(color: AppColorStyle.white))
                              ],
                            ),
                            Row(
                              children: [
                                Text("${widget.vig}/${widget.vig1}",
                                    style: AppTextStyles.h2s1
                                        .copyWith(color: AppColorStyle.white))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.names,
                            style: AppTextStyles.h3s1
                                .copyWith(color: AppColorStyle.white))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
