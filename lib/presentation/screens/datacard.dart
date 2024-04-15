import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class DataCard extends StatefulWidget {
  const DataCard(
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
                      AppIconStyle.user, "Usuario", widget.names),
                  _buildDataContainer(
                      AppIconStyle.money, "Saldo", "\$${widget.money}"),
                  _buildDataContainer(
                      AppIconStyle.accbox, "Numero de cuenta", widget.account),
                  _buildDataContainer(
                      AppIconStyle.date, "Vigencia", "${widget.vig.toString()}/${ widget.vig1.toString()}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer(IconData icon, String label, String data) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 60) / 2;

    return Container(
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
          Icon(icon, color: AppColorStyle.white),
          Text(label,
              style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
          Text(data,
              textAlign: TextAlign.center,
              style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
        ],
      ),
    );
  }
}
