import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importa el paquete para el portapapeles
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class DataCard extends StatefulWidget {
  const DataCard(
      {super.key,
      required this.accountNumber,
      required this.phone,
      required this.name,
      required this.balance,
      required this.email,
      required this.cardNumber});

  final String name;
  final String email;
  final String phone;
  final String cardNumber;
  final String accountNumber;
  final double balance;

  @override
  State<DataCard> createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColorStyle.white),
        title: Row(
          children: [
            const Icon(AppIconStyle.info, color: AppColorStyle.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text("Informacion de la tarjeta",
                  style:
                      AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
            )
          ],
        ),
        backgroundColor: AppColorStyle.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColorStyle.secundary2,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 15.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/InfinityVerticalLogo 1.png",
                              width: 100.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  _buildDataContainer(
                      AppIconStyle.user, "Usuario", widget.name),
                  _buildDataContainer(AppIconStyle.money, "Saldo",
                      "\$${widget.balance.toStringAsFixed(2)}"),
                  _buildDataContainer(AppIconStyle.accbox, "Numero de cuenta",
                      widget.accountNumber,
                      isCopyable: true),
                  _buildDataContainer(AppIconStyle.accbox, "Numero de tarjeta",
                      widget.cardNumber,
                      isCopyable: true),
                  _buildDataContainer(
                      AppIconStyle.money, "Correo electronico", widget.email),
                  _buildDataContainer(
                      AppIconStyle.money, "Telefono", widget.phone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer(IconData icon, String label, String data,
      {bool isCopyable = false}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 60) / 2;

    return GestureDetector(
      onTap: () {
        if (isCopyable) {
          Clipboard.setData(ClipboardData(text: data));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Se ha copiado en el portapapeles')),
          );
        }
      },
      child: Container(
        width: containerWidth,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: AppColorStyle.secundary2,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColorStyle.white),
                if (isCopyable) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.copy, color: AppColorStyle.white),
                ],
              ],
            ),
            Text(label,
                style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
            Text(data,
                textAlign: TextAlign.center,
                style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
          ],
        ),
      ),
    );
  }
}
