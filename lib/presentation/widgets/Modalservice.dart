import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class ModalService {
  static Future displayComprobante(
      BuildContext context, String label, Function navigationFunction) {
    final TextEditingController referencia = TextEditingController();
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
                            keyboardType: TextInputType.number,
                            controller: referencia,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 8),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    if (navigationFunction != null) {
                                      navigationFunction();
                                    }
                                  });
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColorStyle.primary)),
                                child: Text(
                                  "Buscar",
                                  style: AppTextStyles.h4s1
                                      .copyWith(color: AppColorStyle.white),
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 8),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColorStyle.red)),
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
                ],
              ),
            ));
  }
}
