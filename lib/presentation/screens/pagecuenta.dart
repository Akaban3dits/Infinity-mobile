
import 'package:flutter/material.dart';
import 'package:infinity_bank/domain/entities/movements.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:intl/intl.dart';

class EDOscreen extends StatefulWidget {
  final List<MovementsBank> listMonth;
  final String month;
  final String month2;

  const EDOscreen({super.key, required this.listMonth, required this.month, required this.month2});

  @override
  State<EDOscreen> createState() => _EDOscreenState();
}

class _EDOscreenState extends State<EDOscreen> {
  late List<MovementsBank> listMonth;

  @override
  void initState() {
    super.initState();
    listMonth = widget.listMonth;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.secundary2,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tus movimientos${widget.month}",
                  style:
                      AppTextStyles.h3s1.copyWith(color: AppColorStyle.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMonth.length,
              itemBuilder: (context, index) {
                String formattedDate =
                    DateFormat('dd/MM/yyyy').format(listMonth[index].fecha);
                return Container(
                  width: 170,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColorStyle.primary,
                      AppColorStyle.secundary
                    ]),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(listMonth[index].tipo,
                              style: AppTextStyles.h2s1
                                  .copyWith(color: AppColorStyle.white)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              listMonth[index].usuario,
                              style: AppTextStyles.h3s1
                                  .copyWith(color: AppColorStyle.white),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${listMonth[index].monto} USD",
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white)),
                          Text(formattedDate,
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(listMonth[index].detalle,
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white))
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(listMonth[index].estado,
                                style: AppTextStyles.h3s1
                                    .copyWith(color: AppColorStyle.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColorStyle.primary)),
                        onPressed: () {
                          String body = "Ha comenzado la descarga de tu Estado de cuenta de ${widget.month2}";
                          NotificationService.showNotification(body);
                        },
                        child: Text(
                          "Generar sobre +",
                          style: AppTextStyles.h4s1
                              .copyWith(color: AppColorStyle.white),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
