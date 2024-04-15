import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/edocuentatab.dart'; // Asegúrate que Mesnav está definido aquí

class ContCuenta extends StatefulWidget {
  const ContCuenta({super.key});

  @override
  State<ContCuenta> createState() => _ContCuentaState();
}

class _ContCuentaState extends State<ContCuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Resumen del",
                        style: AppTextStyles.h1s1
                            .copyWith(color: AppColorStyle.white),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "estado de cuenta",
                        style: AppTextStyles.h1s1
                            .copyWith(color: AppColorStyle.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColorStyle.secundary2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Expanded(child: Mesnav())],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
